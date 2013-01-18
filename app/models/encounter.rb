class Encounter < ActiveRecord::Base
  has_and_belongs_to_many :traits
  has_and_belongs_to_many :monsters
  belongs_to :quest, :counter_cache => true

  #TODO - make this work
  #validate :trait_ids, :relationship => {:minimum => 2}
  validates :name, :presence => true
  
end
