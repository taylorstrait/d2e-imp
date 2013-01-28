class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    if params[:name].present?
      item = Skill.find_by_name(params[:name])
      if item
        redirect_to item and return
      else
        flash[:notice] = "Skill by the name of '#{params[:name]}' not found."
        redirect_to skills_url
      end
    else
      @skills = Skill.includes(:profession).order(:name).all
      @skill_names = Skill.pluck(:name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @Skill.save
        format.html { redirect_to @skill, notice: 'skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        format.html { render action: "new" }
        format.json { render json: @Skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @Skill.update_attributes(params[:skill])
        format.html { redirect_to @skill, notice: 'skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @Skill.destroy

    respond_to do |format|
      format.html { redirect_to abilities_url }
      format.json { head :no_content }
    end
  end
end
