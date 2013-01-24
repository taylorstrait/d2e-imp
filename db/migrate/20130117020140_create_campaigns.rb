class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :quests_count, :default => 0, :null => false
      t.boolean :official_release, :default => false, :null => false
      t.integer :game_id
      t.integer :user_id, :null => false
      t.boolean :is_official, :default => false, :null => false
      t.timestamps
    end

    add_index :campaigns, :name, :unique => true
    add_index :campaigns, :slug, :unique => true
    add_index :campaigns, :game_id
  end
end
