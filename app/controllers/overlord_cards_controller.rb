class OverlordCardsController < ApplicationController
  # GET /overlord_cards
  # GET /overlord_cards.json
  def index
    if params[:name].present?
      overlord_card = OverlordCard.find_by_name(params[:name])
      if overlord_card
        redirect_to overlord_card and return
      else
        flash[:notice] = "Overlord_card by the name of '#{params[:name]}' not found."
        redirect_to heroes_url
      end
    else
      @overlord_cards = OverlordCard.includes(:game).order(:category, :xp_cost, :name).all
      @names = OverlordCard.pluck(:name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heroes }
    end
  end

  # GET /overlord_cards/1
  # GET /overlord_cards/1.json
  def show
    @overlord_card = OverlordCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @overlord_card }
    end
  end

  # GET /overlord_cards/new
  # GET /overlord_cards/new.json
  def new
    @overlord_card = OverlordCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @overlord_card }
    end
  end

  # GET /overlord_cards/1/edit
  def edit
    @overlord_card = OverlordCard.find(params[:id])
  end

  # POST /overlord_cards
  # POST /overlord_cards.json
  def create
    @overlord_card = OverlordCard.new(params[:overlord_card])

    respond_to do |format|
      if @overlord_card.save
        format.html { redirect_to @overlord_card, notice: 'Overlord card was successfully created.' }
        format.json { render json: @overlord_card, status: :created, location: @overlord_card }
      else
        format.html { render action: "new" }
        format.json { render json: @overlord_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /overlord_cards/1
  # PUT /overlord_cards/1.json
  def update
    @overlord_card = OverlordCard.find(params[:id])

    respond_to do |format|
      if @overlord_card.update_attributes(params[:overlord_card])
        format.html { redirect_to @overlord_card, notice: 'Overlord card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @overlord_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overlord_cards/1
  # DELETE /overlord_cards/1.json
  def destroy
    @overlord_card = OverlordCard.find(params[:id])
    @overlord_card.destroy

    respond_to do |format|
      format.html { redirect_to overlord_cards_url }
      format.json { head :no_content }
    end
  end
end
