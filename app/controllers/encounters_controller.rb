class EncountersController < ApplicationController
  # GET /encounters
  # GET /encounters.json
  def index
    @quest = Quest.find(params[:quest_id])
    @encounters = @quest.encounters

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @encounters }
    end
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
    @quest = Quest.find(params[:quest_id])
    @encounter = @quest.encounters.includes(:monsters, :traits, :quest).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encounter }
    end
  end

  # GET /encounters/new
  # GET /encounters/new.json
  def new
    @quest = Quest.find(params[:quest_id])
    @encounter = @quest.encounters.new(:position => (@quest.encounters.last.try(:position) || 0) + 1,
                                        :name => "Encounter #{(@quest.encounters.last.try(:position) || 0) + 1}")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @encounter }
    end
  end

  # GET /encounters/1/edit
  def edit
    @encounter = Encounter.includes(:traits, :monsters).find(params[:id])
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(params[:encounter])

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: 'Encounter was successfully created.' }
        format.json { render json: @encounter, status: :created, location: @encounter }
      else
        format.html { render action: "new" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encounters/1
  # PUT /encounters/1.json
  def update
    @encounter = Encounter.find(params[:id])

    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        
        # clear monsters HABTM if needed 
        if !params[:encounter][:monster_ids].present?
          @encounter.monsters.clear
        end

        format.html { redirect_to @encounter, notice: 'Encounter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to encounters_url }
      format.json { head :no_content }
    end
  end

  def generate_monster_list
    
    @encounter = Encounter.find(params[:encounter_id])

    if current_user
      monster_list = current_user.monster_ids
    else
      monster_list = Monster.pluck(:id)
    end

    # main query
    if @encounter.monsters.size > 0
      @game_monsters = Monster.joins(:traits).where(:traits => {:id => @encounter.trait_ids}).where("role = 'Monster' AND monster_id IN (?)", monster_list).where("monsters.id NOT IN (?)", @encounter.monster_ids).order("monsters.name ASC").uniq
    else
      @game_monsters = Monster.joins(:traits).where(:traits => {:id => @encounter.trait_ids}).where("role = 'Monster' AND monster_id IN (?)", monster_list).order("monsters.name ASC").uniq
    end
    
    # if we found any matching monsters...
    if @game_monsters.size > 0
      # generate limited pool
      @monster_options = @game_monsters.clone.shuffle

      # break out the open groups
      # init counter
      counter = 1
      @open_group = {}

      # for each open group...
      @encounter.num_open_groups.times do

        # create a new nested variable
        @open_group[counter] = []
        
        # for each card to draw...
        params[:pool_size].to_i.times do
          
          # pop one card off the shuffled pool
          @open_group[counter] << @monster_options.pop

        end

        # alphabetize the list
        if @open_group[counter].size > 1
          @open_group[counter].sort_by! &:name
        end
        counter += 1
      end

      # alphabetize the remaining options
      @monster_options.sort_by! &:name

    else
      flash.now[:notice] = "No monsters available. Does the encounter have the correct traits?"
    end

    render :show
  end
end
