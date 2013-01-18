class Quest < ActiveRecord::Base
  belongs_to :campaign, :counter_cache => true
  has_many :encounters
end
