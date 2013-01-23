class AbilitiesController < ApplicationController
  # GET /abilities
  # GET /abilities.json
  def index
    @abilities = Ability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abilities }
    end
  end

  # GET /abilities/1
  # GET /abilities/1.json
  def show
    @ability = Ability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ability }
    end
  end

  # GET /abilities/new
  # GET /abilities/new.json
  def new
    @ability = Ability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ability }
    end
  end

  # GET /abilities/1/edit
  def edit
    @ability = Ability.find(params[:id])
  end

  # POST /abilities
  # POST /abilities.json
  def create
    @ability = Ability.new(params[:ability])

    respond_to do |format|
      if @ability.save
        format.html { redirect_to @ability, notice: 'Ability was successfully created.' }
        format.json { render json: @ability, status: :created, location: @ability }
      else
        format.html { render action: "new" }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abilities/1
  # PUT /abilities/1.json
  def update
    @ability = Ability.find(params[:id])

    respond_to do |format|
      if @ability.update_attributes(params[:ability])
        format.html { redirect_to @ability, notice: 'Ability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abilities/1
  # DELETE /abilities/1.json
  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy

    respond_to do |format|
      format.html { redirect_to abilities_url }
      format.json { head :no_content }
    end
  end
end
