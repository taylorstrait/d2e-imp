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
      t.boolean :is_private, :default => false, :null => false

      # for campaign tracking
      t.integer :intro_quest_id
      t.integer :act1_quests, :null => false, :default => 1
      t.integer :interlude_heroes_id
      t.integer :interlude_ol_id
      t.integer :act2_quests, :null => false, :default => 1
      t.integer :finale_heroes_id
      t.integer :finale_ol_id
      t.timestamps
    end

    add_index :campaigns, :name, :unique => true
    add_index :campaigns, :slug, :unique => true
    add_index :campaigns, :game_id
  end
end
