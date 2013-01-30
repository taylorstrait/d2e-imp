class OverlordCard < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  has_and_belongs_to_many :adventures
end
