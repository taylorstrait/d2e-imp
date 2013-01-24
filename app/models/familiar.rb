class Familiar < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  belongs_to :hero
  belongs_to :profession
end
