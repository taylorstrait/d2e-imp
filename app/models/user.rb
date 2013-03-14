class User < ActiveRecord::Base
  
  has_and_belongs_to_many :games
  has_and_belongs_to_many :heroes
  has_and_belongs_to_many :monsters
  has_many :adventures
  has_many :adventurers
  has_many :chapters

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :birthdate, :bgg_profile_name, :game_ids, :monster_ids, :hero_ids, :role
  # attr_accessible :title, :body

validates :username, :presence => true, :uniqueness => true

  def is_admin?
    self.role == "admin"
  end

  def self.eligible_usernames
    u = User.pluck(:username)
    u.delete("Administrator")
    return u
  end
  
    private

    def before_destroy
      games.clear
      heroes.clear
      monsters.clear
    end
end
