class Item < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :game
  belongs_to :profession
  has_and_belongs_to_many :adventurers


  def name_with_price
    "#{name} (#{buy_cost}gp)"
  end
end
