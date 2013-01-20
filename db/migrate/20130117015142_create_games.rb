class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :null => false
      t.string :short_name, :null => false
      t.string :bgg_url
      t.integer :edition, :default => 2, :null => false
      t.integer :monsters_count, :default => 0, :null => false
    end
  end
end
