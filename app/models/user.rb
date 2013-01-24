class User < ActiveRecord::Base

  has_and_belongs_to_many :games
  has_and_belongs_to_many :heroes
  has_and_belongs_to_many :monsters

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :birthdate, :bgg_profile_name, :game_ids, :monster_ids, :hero_ids
  # attr_accessible :title, :body
end
