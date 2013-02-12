class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_and_belongs_to_many :adventurers
  has_and_belongs_to_many :overlord_cards
  has_and_belongs_to_many :items
  has_many :chapters, :dependent => :destroy, :order => "created_at DESC"
  has_many :quests, :through => :chapters

  validates :name, :presence => true
  validates :campaign_id, :presence => true
  validates :user_id, :presence => true

  def is_complete?
    completed_at.present?
  end

  def hero_win_percentage
    all_quests = chapters.group_by {|quest| quest.final_winner}
    if all_quests["Heroes"]
      return (all_quests["Heroes"].size.to_f/chapters.size.to_f) * 100
    end
  end

  private

    def before_destroy
      adventurers.clear
      items.clear
      overlord_cards.clear
    end
end
