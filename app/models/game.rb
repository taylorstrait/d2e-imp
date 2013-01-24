class Game < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :monsters, :order => "role ASC, name ASC"
  has_many :regular_monsters, :class_name => 'Monster', :conditions => 'role = "Monster"', :order => "name ASC"
  has_many :heroes, :order => "name ASC"
  has_many :items, :order => "name ASC"
  has_many :familiars, :order => "name ASC"
  has_and_belongs_to_many :users
end
