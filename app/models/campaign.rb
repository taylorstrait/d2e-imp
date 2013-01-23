class Campaign < ActiveRecord::Base
  has_many :quests, :order => "position ASC"
  belongs_to :user
belongs_to :game
end
