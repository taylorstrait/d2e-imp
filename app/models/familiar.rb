class Familiar < ActiveRecord::Base
  belongs_to :hero
  belongs_to :profession
end
