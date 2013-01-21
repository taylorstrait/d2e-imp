class CreateHeroesUsers < ActiveRecord::Migration
  def change
    create_table :games_heroes do |t|
      t.integer :hero_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :games_heroes, :hero_id
    add_index :games_heroes, :user_id
  end
end
