class DiceController < ApplicationController

  def dice_roller
  end

  def roll_dice
    number = (1 + rand(6))
    render :partial => "dice", :locals => {:number => number, :color => params[:color]}
  end


end
