class DiceController < ApplicationController

  def dice_roller
  end

  # params[:colors] come in the format '{COLOR} {COLOR} {COLOR}'
  def roll_dice

    # convert params into array of lowercase words like [color, color, color]
    # we use lowercase to render the output dice image 'color.png'
    colors = params[:colors].gsub(/[ {]/, "").downcase.split("}")

    results = []

    for color in colors do
      current_roll = {} # create a new hash
      current_roll['number'] = (1 + rand(6)) # create a random number
      current_roll['color'] = color.downcase # add the color
      results << current_roll
    end
    render :partial => "dice", :locals => {:rolls => results}
  end


end
