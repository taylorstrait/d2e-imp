class Profession < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  belongs_to :archetype
  has_many :items, :order => "name ASC"
  has_many :skills, :order => "xp_cost ASC, name ASC"
  has_one :familiar

  # convenience method for returning all 0-cost starting skills
  def starting_skills
    skills.where(:xp_cost => 0).order("skills.name")
  end

end
