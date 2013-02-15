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

end
