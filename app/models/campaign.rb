class Campaign < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :quests, :order => "position ASC"
  belongs_to :user
  belongs_to :game
end
