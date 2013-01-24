class AddRewardsToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :reward_xp_base, :integer, :default => 1, :null => false
    add_column :quests, :reward_xp_hero, :integer, :default => 0, :null => false
    add_column :quests, :reward_xp_ol, :integer, :default => 0, :null => false
    add_column :quests, :reward_gold_per_hero, :integer, :default => 0, :null => false
    add_column :quests, :reward_hero_item_id, :integer
    add_column :quests, :reward_ol_item_id, :integer
    add_column :quests, :hero_win_closed_quest_id, :integer
    add_column :quests, :ol_win_closed_quest_id, :integer
    add_column :quests, :ongoing_effect_hero_win, :string
    add_column :quests, :ongoing_effect_ol_win, :string
  end
end
