class MonstersController < ApplicationController
  # GET /monsters
  # GET /monsters.json
  def index
    if params[:name].present?
      monster = Monster.find_by_name(params[:name])
      if monster
        redirect_to monster and return
      else
        flash[:notice] = "Monster by the name of '#{params[:name]}' not found."
        redirect_to monsters_url
      end
    else
      @monsters = Monster.includes(:game).order(:name).all
      @monster_names = Monster.pluck(:name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heroes }
    end
  end

  # GET /heroes/1
  # GET /heroes/1.json
  def show
    @monster = Monster.includes(:game).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hero }
    end
  end

  # GET /monsters/new
  # GET /monsters/new.json
  def new
    @monster = Monster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monster }
    end
  end

  # GET /monsters/1/edit
  def edit
    @monster = Monster.find(params[:id])
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(params[:monster])

    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render json: @monster, status: :created, location: @monster }
      else
        format.html { render action: "new" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /monsters/1
  # PUT /monsters/1.json
  def update
    @monster = Monster.find(params[:id])

    respond_to do |format|
      if @monster.update_attributes(params[:monster])
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy

    respond_to do |format|
      format.html { redirect_to monsters_url }
      format.json { head :no_content }
    end
  end
end
