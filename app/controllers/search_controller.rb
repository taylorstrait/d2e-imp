class SearchController < ApplicationController

  def index
    [Campaign, Quest, Hero, Monster, Item, Skill, Familiar].each do |thing|
      found_object = thing.find_by_name(params[:name])
      if found_object
        redirect_to found_object and return
      end
    end
    flash[:notice] = "Your search for '#{params[:name]}' returned no results."
    redirect_to :root
  end
end
