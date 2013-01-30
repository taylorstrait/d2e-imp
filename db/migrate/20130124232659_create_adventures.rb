class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.text :description
      t.integer :campaign_id, :null => false
      t.string :current_act, :null => false, :default => "1"
      t.string :winner
      t.datetime :completed_at

      # overlord
      t.integer :ol_user_id
      t.integer :ol_available_xp, :null => false, :default => 0

      # heroes
      t.integer :hero_gold, :null => false, :default => 0

      # campaign options
      t.integer :hero_starting_xp, :default => 0, :null => false
      t.integer :hero_starting_gold, :default => 0, :null => false
      t.integer :ol_starting_xp, :default => 0, :null => false
      t.integer :ol_open_group_pool_size, :default => 0, :null => false
      t.boolean :skip_intro, :default => false
      t.boolean :is_private, :default => false, :null => false
      
      t.timestamps
    end
  end
end
