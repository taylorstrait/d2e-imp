class ProfessionsController < ApplicationController
  # GET /professions
  # GET /professions.json
  def index
    @professions = Profession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @professions }
    end
  end

  # GET /professions/1
  # GET /professions/1.json
  def show
    @profession = Profession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profession }
    end
  end

  # GET /professions/new
  # GET /professions/new.json
  def new
    @profession = Profession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profession }
    end
  end

  # GET /professions/1/edit
  def edit
    @profession = Profession.find(params[:id])
  end

  # POST /professions
  # POST /professions.json
  def create
    @profession = Profession.new(params[:profession])

    respond_to do |format|
      if @profession.save
        format.html { redirect_to @profession, notice: 'Profession was successfully created.' }
        format.json { render json: @profession, status: :created, location: @profession }
      else
        format.html { render action: "new" }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /professions/1
  # PUT /professions/1.json
  def update
    @profession = Profession.find(params[:id])

    respond_to do |format|
      if @profession.update_attributes(params[:profession])
        format.html { redirect_to @profession, notice: 'Profession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professions/1
  # DELETE /professions/1.json
  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy

    respond_to do |format|
      format.html { redirect_to professions_url }
      format.json { head :no_content }
    end
  end
end
