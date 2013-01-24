class Quest < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :campaign, :counter_cache => true
  has_many :encounters, :order => "position ASC"
  belongs_to :user

  # return a list of unique monsters in all of a quest's encounters
  def monsters
    monsters = []
    encounters.each {|x| monsters << x.monster_ids}
    return Monster.order(:role, :name).find(monsters.uniq)
  end
end