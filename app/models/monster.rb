class Monster < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game, :counter_cache => true
  has_and_belongs_to_many :traits
  has_and_belongs_to_many :encounters
  has_and_belongs_to_many :users

    private

    def before_destroy
      traits.clear
      encounters.clear
      users.clear
    end

end
