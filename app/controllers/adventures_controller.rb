class AdventuresController < ApplicationController
  # GET /adventures
  # GET /adventures.json
  def index
    if params[:username] # are we searching for a single user's adventures?
      @user = User.find_by_username(params[:username])
      @adventures = Adventure.includes(:user, :campaign, :chapters => :quest, :adventurers => [:hero, :profession]).where(:user_id => @user.id).order("chapters.updated_at DESC").limit(20).all
    else
      @adventures = Adventure.includes(:user, :campaign, :chapters => :quest, :adventurers => [:hero, :profession]).order("updated_at DESC").limit(20).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adventures }
    end
  end

  # GET /adventures/1
  # GET /adventures/1.json
  def show
    @adventure = Adventure.includes(:chapters, :adventurers => [:profession, :hero, :items, :skills]).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adventure }
    end
  end

  # GET /adventures/new
  # GET /adventures/new.json
  def new
    if user_signed_in?
      
      if current_user.game_ids.empty? # no games or figures?
        flash[:notice] = "You must set up your owned games and figures to start a new adventure."
        redirect_to :edit_user_registration

      else # start a new adventure
        @users = User.eligible_usernames
        @campaigns = Campaign.where("is_official = ? AND game_id IN (?)", true, current_user.game_ids).all
        @heroes = Hero.order(:name).where("id IN (?)", current_user.hero_ids).select([:name, :slug, :id])
        @adventure = Adventure.new
      end

    else # not signed in
      flash[:notice] = "You must be signed in to start a new adventure."
      redirect_to :new_user_session
    end
  end

  # GET /adventures/1/edit
  def edit
    @adventure = Adventure.find(params[:id])
    @users = User.eligible_usernames
  end

  # POST /adventures
  # POST /adventures.json
  def create
    
    #### SET ADVENTURE VARIABLES ############
    @adventure = Adventure.new(params[:adventure])
    @adventure.ol_available_xp = @adventure.ol_starting_xp
    @adventure.hero_gold = @adventure.hero_starting_gold
    @adventure.user = current_user
    
    #### SET CAMPAIGN ACT ############
    if (@adventure.skip_intro == true) || (@adventure.campaign.quests.where(:act => "Intro").size == 0)
      @adventure.current_act = "1"
    end

    if @adventure.save
      
      #### CREATE HEROES ############
      params[:heroes].each do |k,v|

        adventurer = Adventurer.new(hero_id: v["hero_id"], profession_id: v["profession_id"])
        adventurer.user = User.find_by_username(v["username"])
        adventurer.available_xp = @adventure.hero_starting_xp
          if adventurer.valid?
            adventurer.save
            adventurer.skills = adventurer.profession.starting_skills
            adventurer.items = adventurer.profession.items
            @adventure.adventurers << adventurer
          end       
        end

      # assign overlord cards
      @adventure.overlord_cards = OverlordCard.where(:category => "Basic").all

      redirect_to @adventure, notice: 'Adventure was successfully created.'
    else

      # we are redirecting so get data ready for form again
      @campaigns = Campaign.where("is_official = ? AND game_id IN (?)", true, current_user.game_ids).all
      @heroes = Hero.order(:name).where("id IN (?)", current_user.hero_ids).all
      @available_professions = Profession.all
      flash.now[:errors] = "There was a problem creating this adventure. Are all of your fields filled in?"
      render action: "new"
    end
  end

  # PUT /adventures/1
  # PUT /adventures/1.json
  def update
    @adventure = Adventure.find(params[:id])

    respond_to do |format|
      if @adventure.update_attributes(params[:adventure])

        if params[:heroes]
          params[:heroes].each do |id,properties|
            hero = Adventurer.find(id).update_attributes(properties)
          end
        end

        format.html { redirect_to @adventure, notice: 'Adventure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventures/1
  # DELETE /adventures/1.json
  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy

    respond_to do |format|
      format.html { redirect_to adventures_url }
      format.json { head :no_content }
    end
  end

  

  ##### AJAX FUNCTIONS #####
  
  def remove_overlord_item
    item = Item.find(params[:item_id])
    if item
      Adventure.find(params[:id]).items.delete(item)
      head :ok
    else
      head :error
    end
  end

    def remove_overlord_card
    card = OverlordCard.find(params[:overlord_card_id])
    if card && card.xp_cost > 0
      Adventure.find(params[:id]).overlord_cards.delete(card)
      head :ok
    else
      head :error
    end
  end

end
