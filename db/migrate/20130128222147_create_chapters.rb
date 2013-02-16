class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :adventure_id
      t.integer :quest_id, :null => false
      t.string :e1_winner
      t.string :e2_winner
      t.string :final_winner
      t.string :e1_open_monsters
      t.string :e2_open_monsters
      t.integer :hero1_id
      t.integer :hero2_id
      t.integer :hero3_id
      t.integer :hero4_id  
      t.integer :hero1_profession_id
      t.integer :hero2_profession_id
      t.integer :hero3_profession_id
      t.integer :hero4_profession_id
      t.integer :gold_from_search_items, :null => false, :default => 0
      t.string :items_found
      t.string :items_sold
      t.string :items_bought
      t.string :skills_bought
      t.text :report
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :chapters, :adventure_id
    add_index :chapters, :quest_id
    add_index :chapters, :user_id
    add_index :chapters, [:adventure_id, :quest_id], :unique => true
  end
end
