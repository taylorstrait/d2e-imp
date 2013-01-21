class Game < ActiveRecord::Base
  has_many :monsters
  has_many :heroes
  has_and_belongs_to_many :users
end
