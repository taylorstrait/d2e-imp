class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :encounters_count, :default => 0, :null => false
      t.integer :position
      t.string :act
      t.boolean :official_release, :default => false, :null => false
      t.integer :campaign_id
      t.integer :user_id, :null => false
      t.integer :group_id
      t.boolean :is_official, :default => false, :null => false
      t.boolean :is_published, :default => false, :null => false

      # for campaign tracking
      t.integer :reward_xp_base, :default => 1, :null => false
      t.integer :reward_xp_hero, :default => 0, :null => false
      t.integer :reward_xp_ol, :default => 0, :null => false
      t.integer :hero_win_gold, :default => 0, :null => false
      t.integer :hero_win_item_id
      t.integer :ol_win_item_id
      t.integer :hero_win_ol_lose_item_id
      t.integer :ol_win_heroes_lose_item_id
      t.integer :hero_win_lose_overlord_card_id
      t.integer :ol_win_gain_overlord_card_id
      t.integer :hero_win_unlock_quest_id
      t.integer :ol_win_unlock_quest_id
      t.string :hero_win_ongoing_effect
      t.string :ol_win_ongoing_effect
      t.timestamps
    end

    add_index :quests, :name, :unique => true
    add_index :quests, :slug, :unique => true
    add_index :quests, :campaign_id
    add_index :quests, :user_id
    add_index :quests, :group_id
  end
end
