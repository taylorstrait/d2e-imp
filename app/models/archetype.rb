class Archetype < ActiveRecord::Base
  has_many :heroes, :order => "name ASC"
  has_many :professions, :order => "name ASC"
end
