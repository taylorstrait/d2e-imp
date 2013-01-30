class AdventurersController < ApplicationController
  # GET /adventurers
  # GET /adventurers.json
  def index
    @adventurers = Adventurer.all

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
end
