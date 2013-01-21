class AddRewardsToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :reward_xp_base, :integer, :default => 1, :null => false
    add_column :quests, :reward_xp_hero, :integer, :default => 0, :null => false
    add_column :quests, :reward_xp_hero_overlord, :integer, :default => 0, :null => false
    add_column :quests, :reward_gold, :integer, :default => 25, :null => false
    add_column :quests, :reward_item_id, :integer
  end

  def up
    Quest.update_all(reward_xp_base: 1, reward_xp_hero: 0, reward_xp_overlord: 0, reward_gold: 25)
  end
end
