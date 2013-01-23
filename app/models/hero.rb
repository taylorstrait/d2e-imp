class Hero < ActiveRecord::Base
  belongs_to :game
  belongs_to :archetype
  has_and_belongs_to_many :users
  has_one :familiar
end
