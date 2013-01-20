class Trait < ActiveRecord::Base
  has_and_belongs_to_many :encounters
  has_and_belongs_to_many :monsters
end
