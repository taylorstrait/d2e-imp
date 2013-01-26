class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.text :description
      t.integer :campaign_id, :null => false
      
      # overlord
      t.integer :ol_user_id

      # heroes
      t.integer :hero1_hero_id, :null => false
      t.integer :hero2_hero_id, :null => false
      t.integer :hero3_hero_id
      t.integer :hero4_hero_id            
      t.integer :hero1_hero_user_id
      t.integer :hero2_hero_user_id
      t.integer :hero3_hero_user_id
      t.integer :hero4_hero_user_id      
      t.integer :hero1_profession_id, :null => false
      t.integer :hero2_profession_id, :null => false
      t.integer :hero3_profession_id
      t.integer :hero4_profession_id

      # campaign options
      t.integer :hero_starting_xp, :default => 0, :null => 0
      t.integer :hero_starting_gold, :default => 0, :null => 0
      t.integer :ol_starting_xp, :default => 0, :null => 0
      t.boolean :skip_intro, :default => false
      
      t.timestamps
    end
  end
end
