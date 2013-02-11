class Trait < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :encounters
  has_and_belongs_to_many :monsters

    private

    def before_destroy
      encounters.clear
      monsters.clear
    end
end
