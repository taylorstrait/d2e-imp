class Item < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
end
