class FamiliarsController < ApplicationController
  # GET /familiars
  # GET /familiars.json
  def index
    @familiars = Familiar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @familiars }
    end
  end

  # GET /familiars/1
  # GET /familiars/1.json
  def show
    @familiar = Familiar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @familiar }
    end
  end

  # GET /familiars/new
  # GET /familiars/new.json
  def new
    @familiar = Familiar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @familiar }
    end
  end

  # GET /familiars/1/edit
  def edit
    @familiar = Familiar.find(params[:id])
  end

  # POST /familiars
  # POST /familiars.json
  def create
    @familiar = Familiar.new(params[:familiar])

    respond_to do |format|
      if @familiar.save
        format.html { redirect_to @familiar, notice: 'Familiar was successfully created.' }
        format.json { render json: @familiar, status: :created, location: @familiar }
      else
        format.html { render action: "new" }
        format.json { render json: @familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /familiars/1
  # PUT /familiars/1.json
  def update
    @familiar = Familiar.find(params[:id])

    respond_to do |format|
      if @familiar.update_attributes(params[:familiar])
        format.html { redirect_to @familiar, notice: 'Familiar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familiars/1
  # DELETE /familiars/1.json
  def destroy
    @familiar = Familiar.find(params[:id])
    @familiar.destroy

    respond_to do |format|
      format.html { redirect_to familiars_url }
      format.json { head :no_content }
    end
  end
end
