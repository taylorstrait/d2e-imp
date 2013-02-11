class HeroesController < ApplicationController
  # GET /heroes
  # GET /heroes.json
  def index
    if params[:name].present?
      hero = Hero.find_by_name(params[:name])
      if hero
        redirect_to hero and return
      else
        flash[:notice] = "Hero by the name of '#{params[:name]}' not found."
        redirect_to heroes_url
      end
    else
      @heroes = Hero.includes(:game, :archetype, :familiar).where(:is_official => true).order(:name).all
      @hero_names = Hero.pluck(:name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heroes }
    end
  end

  # GET /heroes/1
  # GET /heroes/1.json
  def show
    @hero = Hero.includes(:game, :archetype, :familiar).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hero }
    end
  end

  # GET /heroes/new
  # GET /heroes/new.json
  def new
    @hero = Hero.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hero }
    end
  end

  # GET /heroes/1/edit
  def edit
    @hero = Hero.includes(:game, :archetype, :familiar).find(params[:id])
  end

  # POST /heroes
  # POST /heroes.json
  def create
    @hero = Hero.new(params[:hero])

    respond_to do |format|
      if @hero.save
        format.html { redirect_to @hero, notice: 'Hero was successfully created.' }
        format.json { render json: @hero, status: :created, location: @hero }
      else
        format.html { render action: "new" }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /heroes/1
  # PUT /heroes/1.json
  def update
    @hero = Hero.find(params[:id])

    respond_to do |format|
      if @hero.update_attributes(params[:hero])
        format.html { redirect_to @hero, notice: 'Hero was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroes/1
  # DELETE /heroes/1.json
  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy

    respond_to do |format|
      format.html { redirect_to heros_url }
      format.json { head :no_content }
    end
  end

  def professions
    unless params[:id] == "professions"
      hero = Hero.includes(:archetype => :professions).find(params[:id])
      professions = hero.archetype.professions.where("professions.game_id IN (?)", current_user.game_ids).all
      render json: professions, status: :created
    else
      render json: [], status: :created
    end
  end
end
