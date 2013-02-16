class Chapter < ActiveRecord::Base

  before_validation :set_final_winner

  belongs_to :adventure
  belongs_to :quest
  belongs_to :user

  validates :user, :presence => true
  validates :adventure, :presence => true
  validates :quest, :presence => true
  validates :final_winner, :presence => true

  def total_gold_earned
    if final_winner == "Heroes"
      return (self.gold_from_search_items + (quest.hero_win_gold * adventure.adventurers.count))
    else
      return gold_from_search_items
    end
  end


  private

  # set the winner based on number of encounters
  def set_final_winner
    if (quest.encounters.size == 1 && e1_winner == "Heroes") || (quest.encounters.size == 2 && e2_winner == "Heroes")
      self.final_winner = "Heroes"
    elsif (quest.encounters.size == 1 && e1_winner == "Overlord") || (quest.encounters.size == 2 && e2_winner == "Overlord")
      self.final_winner = "Overlord"
    end
  end
  

end
