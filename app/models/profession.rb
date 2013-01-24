class Profession < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  belongs_to :archetype
  has_many :items, :order => "name ASC"
  has_many :abilities, :order => "xp_cost ASC, name ASC"
  has_one :familiar
end
