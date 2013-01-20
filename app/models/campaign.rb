class Campaign < ActiveRecord::Base
  has_many :quests
  belongs_to :user
belongs_to :game
end
