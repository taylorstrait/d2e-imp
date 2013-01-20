class Monster < ActiveRecord::Base
  belongs_to :game, :counter_cache => true
  has_and_belongs_to_many :traits
  has_and_belongs_to_many :encounters
  has_and_belongs_to_many :users

end
