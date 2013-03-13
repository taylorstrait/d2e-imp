class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_many :adventurers, :dependent => :destroy
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

  # update campaign status
  def increment_act(winner)
        
    if self.current_act == "Intro" # if we just finished the intro
      self.current_act = "1"
    
    elsif self.current_act == "1" && (quests.where(:act => "1").size >= campaign.act1_quests) # or if we are done with act 1
      if campaign.quests.where(:act => "Interlude").size > 0 # if there is an interlude
        self.current_act = "Interlude"
      elsif campaign.quests.where(:act => "2").size > 0 # or if there are act 2 quests
        self.current_act = "2"
      else # there must just be a finale
        self.current_act = "Finale"
      end
    
    elsif self.current_act == "Interlude" # or if we are completing an interlude
      if campaign.quests.where(:act => "2").size > 0 # if there are act 2 quests
        self.current_act = "2"
      else # there must just be a finale
        self.current_act = "Finale"
      end

    elsif self.current_act == "2" && (quests.where(:act => "2").size >= campaign.act2_quests) && (campaign.quests.where(:act => "Finale").size > 0)
      self.current_act = "Finale"

    elsif self.current_act == "Finale"
      self.update_attributes(:completed_at => Time.now, :winner => winner)
    end
    self.save
  end

  private

    def before_destroy
      adventurers.clear
      chapters.clear
      items.clear
      overlord_cards.clear
    end
end
