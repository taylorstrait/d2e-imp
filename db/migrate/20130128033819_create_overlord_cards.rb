class CreateOverlordCards < ActiveRecord::Migration
  def change
    create_table :overlord_cards do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.string :subclass, :null => false
      t.string :category, :null => false
      t.integer :xp_cost, :null => false, :default => 0
      t.text :text
      t.integer :user_id, :null => false
      t.boolean :is_official, :default => false, :null => false
      t.boolean :is_published, :default => false, :null => false
      t.integer :game_id
      t.integer :group_id
      t.timestamps
    end

    add_index :overlord_cards, :name
    add_index :overlord_cards, :slug, :unique => true
    add_index :overlord_cards, :user_id
    add_index :overlord_cards, :game_id
    add_index :overlord_cards, :group_id
  end
end
