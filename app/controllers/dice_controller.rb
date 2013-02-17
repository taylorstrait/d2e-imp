class DiceController < ApplicationController

  def dice_roller
  end

  def roll_dice
    results = []
    if params[:colors].class == Array
      colors = params[:colors]
    else
      colors = [params[:colors]]
    end

      for color in colors do
      current_roll = {} # create a new hash
      current_roll['number'] = (1 + rand(6)) # create a random number
      current_roll['color'] = color # add the color
      results << current_roll
    end
    render :partial => "dice", :locals => {:rolls => results}
  end


end
