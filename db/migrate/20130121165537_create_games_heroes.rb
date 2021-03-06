class CreateGamesHeroes < ActiveRecord::Migration
  def change
    create_table :games_heroes do |t|
      t.integer :hero_id, :null => false
      t.integer :game_id, :null => false
    end

    add_index :games_heroes, :hero_id
    add_index :games_heroes, :game_id
  end
end
