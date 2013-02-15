class ToolsController < ApplicationController

  def monster_pool_generator
    if current_user
      @campaigns = Campaign.where("game_id IN (?)", current_user.game_ids).includes(:quests).select([:name, :slug, :id])
    else
      @campaigns = Campaign.includes(:quests).all
    end
  end

  def generate_monster_pool
    
    @encounter = Encounter.find(params[:encounter_id])
    @open_groups = @encounter.generate_open_group_monsters(params[:user_id], params[:pool_size].to_i)

    respond_to do |format|
      format.html { render :partial => "encounters/open_groups" }
      format.json { render json: @open_groups }
    end
  end

end
