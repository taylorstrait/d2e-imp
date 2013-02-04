class Hero < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  belongs_to :user
  belongs_to :archetype
  has_and_belongs_to_many :users
  has_one :familiar
end
