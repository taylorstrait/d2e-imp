class Chapter < ActiveRecord::Base
  
  before_create :set_final_winner


  belongs_to :adventure
  belongs_to :quest
  belongs_to :user


  def total_gold_earned
    if winner == "Heroes"
      return (self.gold_from_search_items + 25) #(quest.hero_win_gold * adventure.adventurers.count))
    else
      return gold_from_search_items
    end
  end


  private

    # set the winner based on number of encounters
  def set_final_winner
    if (quest.encounters.size == 1 && e1_winner == "Heroes") || (quest.encounters.size == 2 && e2_winner == "Heroes")
      final_winner = "Heroes"
    else
      final_winner "Overlord"
    end
  end
  

end
