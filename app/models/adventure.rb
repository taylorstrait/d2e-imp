class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_and_belongs_to_many :adventurers
  has_and_belongs_to_many :overlord_cards
  has_and_belongs_to_many :items
  has_many :chapters, :dependent => :destroy
  has_many :quests, :through => :chapters

  validates :name, :presence => true
  validates :campaign_id, :presence => true
  validates :user_id, :presence => true

  private

    def before_destroy
      adventurers.clear
      items.clear
      overlord_cards.clear
    end
end
