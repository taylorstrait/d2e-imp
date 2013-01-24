class Archetype < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :heroes, :order => "name ASC"
  has_many :professions, :order => "name ASC"
end
