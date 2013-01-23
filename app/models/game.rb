class Game < ActiveRecord::Base
  has_many :monsters, :order => "role ASC, name ASC"
  has_many :heroes, :order => "name ASC"
  has_many :items, :order => "name ASC"
  has_and_belongs_to_many :users
end
