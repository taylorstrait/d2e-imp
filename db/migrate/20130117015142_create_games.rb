class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :null => false
      t.string :short_name, :null => false
      t.string :bgg_url
      t.integer :monsters_count, :default => 0, :null => false

      t.timestamps
    end
  end
end
