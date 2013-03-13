class ChaptersController < ApplicationController
  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chapters }
    end
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chapter }
    end
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = Chapter.new

    # create lists of available quests
    @adventure = Adventure.includes(:campaign, :chapters => :quest).find(params[:adventure_id])
    completed_quests = @adventure.chapters.pluck(:quest_id)

    if @adventure.current_act == "Intro"
      @available_quests = @adventure.campaign.quests.where(:act => "Intro").first #call first to force it to load
    
    elsif @adventure.current_act == "1"
      if completed_quests.empty?
        @available_quests = @adventure.campaign.quests.where(:act => @adventure.current_act).order(:name).all
      else
        @available_quests = @adventure.campaign.quests.where('id NOT IN (?)', completed_quests).where(:act => @adventure.current_act).order(:name).all
      end

    elsif @adventure.current_act == "Interlude"
      if @adventure.chapters.where(:final_winner => "Heroes").size >= (@adventure.campaign.act1_quests.to_f / 2).round
        @available_quests = Quest.find(@adventure.campaign.interlude_heroes_id)
      else
        @available_quests = Quest.find(@adventure.campaign.interlude_ol_id)
      end
    
    elsif @adventure.current_act == "2"
      act2_quests = []
      @adventure.chapters.each do |chapter|
        if chapter.final_winner == "Heroes"
          act2_quests << chapter.quest.hero_win_unlock_quest_id
        else
          act2_quests << chapter.quest.ol_win_unlock_quest_id
        end
        act2_quests.delete_if {|id| id == nil}
        @available_quests = Quest.where(:id => act2_quests).where("id NOT IN (?)", @adventure.quest_ids).all
      end
    
    elsif @adventure.current_act == "Finale"

      @standalone = true # set variable to shorten form view

      if @adventure.chapters.joins(:quest).where(:final_winner => "Heroes").where(:quests => {:act => "2"}).size >= (@adventure.campaign.act2_quests.to_f / 2).round
        @available_quests = Quest.find(@adventure.campaign.finale_heroes_id)
      else
        @available_quests = Quest.find(@adventure.campaign.finale_ol_id)
      end
    end


    # create list of available items for finding or purchase

    # create the exclusion list
    owned_item_ids = []
    @adventure.adventurers.each do |hero|
      owned_item_ids << hero.item_ids
    end
    owned_item_ids.flatten!

    if ["Intro", "1", "Interlude"].include?(@adventure.current_act)
      @available_items = Item.where(:category => "shop_item_act_1").where("id NOT IN (?)", owned_item_ids).where("game_id IN (?)", @adventure.user.game_ids).order(:name).all
    else
      @available_items = Item.where(:category => "shop_item_act_2").where("game_id IN (?)", @adventure.user.game_ids).order(:name).all
    end

    # create list of sellable items
    owned_items = @adventure.adventurers.collect {|x| x.items.pluck('items.id')}.flatten
    @sellable_items = Item.where("id IN (?)", owned_items)

    # create list of available overlord cards
    @overlord_cards = {}
    categories = OverlordCard.where("id NOT IN (?) AND game_id IN (?)", @adventure.overlord_card_ids, @adventure.user.game_ids).pluck(:category).uniq
    categories.delete("Basic")
    categories.each do |category|
      @overlord_cards[category] = OverlordCard.where("id NOT IN (?) AND game_id IN (?)", @adventure.overlord_card_ids, @adventure.user.game_ids).select([:id, :name, :xp_cost]).where(:category => category).order(:xp_cost, :name).map {|card| ["#{card.name} (#{card.xp_cost})", card.id]}
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end

    def new_standalone
    @chapter = Chapter.new
    @quest = Quest.find(params[:quest_id])
    @heroes = Hero.select([:name, :id, :slug]).order(:name).all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end


  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(params[:chapter])

    respond_to do |format|
      if @chapter.valid?

        # set variables to work with
        adventure = @chapter.adventure
        heroes = adventure.adventurers
        quest = @chapter.quest
        campaign = adventure.campaign
        completed_quests = adventure.quests

        # set the winner based on number of encounters
        winner = @chapter.final_winner

        # update campaign status
        if adventure.current_act == "Intro" # if we just finished the intro
          adventure.current_act = "1"
        
        elsif adventure.current_act == "1" && (completed_quests.where(:act => "1").size >= campaign.act1_quests) # or if we are done with act 1
          if campaign.quests.where(:act => "Interlude").size > 0 # if there is an interlude
            adventure.current_act = "Interlude"
          elsif campaign.quests.where(:act => "2").size > 0 # or if there are act 2 quests
            adventure.current_act = "2"
          else # there must just be a finale
            adventure.current_act = "Finale"
          end
        
        elsif adventure.current_act == "Interlude" # or if we are completing an interlude
          if campaign.quests.where(:act => "2").size > 0 # if there are act 2 quests
            adventure.current_act = "2"
          else # there must just be a finale
            adventure.current_act = "Finale"
          end

        elsif adventure.current_act == "2" && (completed_quests.where(:act => "2").size >= campaign.act2_quests) && (campaign.quests.where(:act => "Finale").size > 0)
          adventure.current_act = "Finale"
        end
        adventure.save

        ###### start with XP #####

        if winner == "Heroes"
          total_hero_xp = (quest.reward_xp_base + quest.reward_xp_hero)
          total_ol_xp = quest.reward_xp_base
        else
          total_hero_xp = quest.reward_xp_base
          total_ol_xp = (quest.reward_xp_base + quest.reward_xp_ol)
        end

        # heroes
        heroes.each do |hero|
          hero.update_attribute(:available_xp, (hero.available_xp + total_hero_xp))
          hero.save
        end

        #ol
        adventure.update_attribute(:ol_available_xp, adventure.ol_available_xp + total_ol_xp)


        ##### Gold ####
        # Quest gold
        if winner == "Heroes"
          gold_to_be_added = (quest.hero_win_gold * adventure.adventurers.size)
        end

        # search item gold
        gold_to_be_added += @chapter.gold_from_search_items

        # save gold
        adventure.hero_gold += gold_to_be_added
        adventure.save



        #####add the reward items, if applicable #####
        if winner == "Heroes"

          if quest.hero_win_item_id.present?
            adventure.adventurers.first.items << Item.find(quest.hero_win_item_id)
          end

          if quest.hero_win_ol_lose_item_id.present?
            adventure.items.delete(Item.find(quest.hero_win_ol_lose_item_id))
          end

        elsif winner == "Overlord"

          # give ol item
          if quest.ol_win_item_id.present?
            adventure.items << Item.find(quest.ol_win_item_id)
          end

          # take away hero items, if needed
          if quest.ol_win_heroes_lose_item_id.present?
            lost_item = Item.find_by_id(quest.ol_win_heroes_lose_item_id)
            
            adventure.adventurers.each do |hero|
              
              if hero.items.include?(lost_item)
                hero.items.delete(lost_item)
              end
            end
          end

          # give ol card
          if quest.ol_win_gain_overlord_card_id.present?
            adventure.overlord_cards << OverlordCard.find(quest.ol_win_gain_overlord_card_id)
          end
        end

        # iterate through heroes and adjust items based on found, bought, and sold

        unless params[:standalone] == "true"

          params[:adventurers].each do |k,v|

            hero = Adventurer.find(k.to_i)
  
            # add found item
            unless v['found_item'].blank?
              hero.items << Item.find(v['found_item'].to_i)
            end
    
            # sell items
            unless v['sold_items'].blank?
              v['sold_items'].each do |item_id|
                sold_item = Item.find(item_id.to_i)
                adventure.hero_gold += sold_item.sell_cost
                hero.items.delete(sold_item)
              end
              adventure.save
            end
    
            # add  bought items
            
            v['bought_items'].each do |item_id|
              unless item_id.blank?
                bought_item = Item.find(item_id.to_i)
                hero.items << bought_item
                adventure.hero_gold -= bought_item.buy_cost
              end
              adventure.save
            end
    
            # add new skills
            unless v['new_skills'].blank?
              v['new_skills'].each do |skill_id|
                new_skill = Skill.find(skill_id.to_i)
                hero.skills << new_skill
                hero.available_xp -= new_skill.xp_cost
                hero.save
              end
            end
          end
        end

        # add overlords cards
        if params[:overlord_cards]
          params[:overlord_cards].each do |card_id|
            new_card = OverlordCard.find(card_id)
            if new_card
              adventure.overlord_cards << new_card
              adventure.ol_available_xp -= new_card.xp_cost
            end
          end
          adventure.save
        end
        
        # complete adventure if it is the finale
        if quest.act == "Finale"
          adventure.update_attributes(:completed_at => Time.now, :winner => @chapter.final_winner)
        end

        # finally save the chapter
        @chapter.save

        format.html { redirect_to adventure, notice: 'Chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else

        format.html { redirect_to new_adventure_url(:adventure_id => adventure.id) }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to chapters_url }
      format.json { head :no_content }
    end
  end
end
