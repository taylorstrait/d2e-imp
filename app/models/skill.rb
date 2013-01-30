class Skill < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :profession
  has_and_belongs_to_many :adventurers
  
end
