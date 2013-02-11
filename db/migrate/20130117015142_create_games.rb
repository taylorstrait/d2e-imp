class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.string :short_name, :null => false
      t.string :very_short_name, :null => false
      t.string :bgg_url
      t.integer :expands_game_id
      t.integer :monsters_count, :default => 0, :null => false
      t.integer :heroes_count, :default => 0, :null => false
      t.integer :quests_count, :default => 0, :null => false
      t.integer :items_count, :default => 0, :null => false
      t.integer :overlord_cards_count, :default => 0, :null => false
    end

    add_index :games, :name, :unique => true
    add_index :games, :slug, :unique => true
  end
end
