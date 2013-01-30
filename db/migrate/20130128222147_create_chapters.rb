class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :adventure_id, :null => false
      t.integer :quest_id, :null => false
      t.string :winner
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
  end
end
