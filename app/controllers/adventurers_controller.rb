class AdventurersController < ApplicationController
  # GET /adventurers
  # GET /adventurers.json
  def index
    @adventurers = current_user.adventurers.includes(:hero, :items, :skills, :adventure).order("updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adventurers }
    end
  end

  # GET /adventurers/1
  # GET /adventurers/1.json
  def show
    @adventurer = Adventurer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adventurer }
    end
  end

  # GET /adventurers/new
  # GET /adventurers/new.json
  def new
    @adventurer = Adventurer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adventurer }
    end
  end

  # GET /adventurers/1/edit
  def edit
    @adventurer = Adventurer.find(params[:id])
  end

  # POST /adventurers
  # POST /adventurers.json
  def create
    @adventurer = Adventurer.new(params[:adventurer])

    respond_to do |format|
      if @adventurer.save
        format.html { redirect_to @adventurer, notice: 'Adventurer was successfully created.' }
        format.json { render json: @adventurer, status: :created, location: @adventurer }
      else
        format.html { render action: "new" }
        format.json { render json: @adventurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adventurers/1
  # PUT /adventurers/1.json
  def update
    @adventurer = Adventurer.find(params[:id])

    respond_to do |format|
      if @adventurer.update_attributes(params[:adventurer])
        format.html { redirect_to @adventurer, notice: 'Adventurer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adventurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventurers/1
  # DELETE /adventurers/1.json
  def destroy
    @adventurer = Adventurer.find(params[:id])
    @adventurer.destroy

    respond_to do |format|
      format.html { redirect_to adventurers_url }
      format.json { head :no_content }
    end
  end


  def play

    # load adventurer if param
    if params[:adventurer_id]
      @adventurer = Adventurer.find(params[:adventurer_id])
      @hide_nav = true

    # else create a new adventurer
    elsif params[:hero_id] && params[:profession_id] && user_signed_in?
      @adventurer = Adventurer.create(:hero_id => params[:hero_id], :profession_id => params[:profession_id], :user_id => current_user.id)
      @adventurer.skills = @adventurer.profession.starting_skills
      @adventurer.items = @adventurer.profession.items
      flash.now[:info] = "This hero instance has been saved and can be accessed via My Profile -> My Heroes."
      @hide_nav = true
    else
      flash[:errors] = "There was an error. You broke something! Are you  signed in?"
      redirect_to :root
    end
  end

  def update_health
    adventurer = Adventurer.find(params[:id])
    unless adventurer.current_health + params[:amount].to_i < 0
      adventurer.update_attribute(:current_health, adventurer.current_health + params[:amount].to_i)
    end
    render :text => adventurer.current_health
  end

  def update_stamina
    adventurer = Adventurer.find(params[:id])
    unless adventurer.current_stamina + params[:amount].to_i < 0
      adventurer.update_attribute(:current_stamina, adventurer.current_stamina + params[:amount].to_i)
    end
    render :text => adventurer.current_stamina
  end

  ##### AJAX METHODS #####
  def remove_item
    @adventurer = Adventurer.find(params[:id])
    item = Item.find(params[:item_id])
    if item
      @adventurer.items.delete(item)
      head :ok
    end
  end  

  def remove_skill
    skill = Skill.find(params[:skill_id])
    if skill.xp_cost > 0
      Adventurer.find(params[:id]).skills.delete(skill)
      head :ok
    else
      head :error
    end
  end


end
