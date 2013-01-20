class Quest < ActiveRecord::Base
  belongs_to :campaign, :counter_cache => true
  has_many :encounters
  belongs_to :user

  def monsters
    monsters = []
    encounters.each {|x| monsters << x.monster_ids}
    return Monster.order(:role, :name).find(monsters.uniq)
  end
end
