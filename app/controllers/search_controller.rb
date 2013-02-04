class SearchController < ApplicationController

  def index
    [Campaign, Quest, Hero, Monster, Item, Skill, Familiar].each do |thing|
      found_object = thing.find_by_name(params[:name])
      unless found_object.nil?
        redirect_to found_object and return
      end
    end
  end
end
