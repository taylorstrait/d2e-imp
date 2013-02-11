class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :archetype_id, :null => false
      t.integer :game_id
      t.text :description
      t.boolean :is_official, :default => false, :null => false
      t.boolean :is_published, :default => false, :null => false
      t.integer :group_id
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :professions, :name, :unique => true
    add_index :professions, :slug, :unique => true
    add_index :professions, :archetype_id
    add_index :professions, :game_id
    add_index :professions, :user_id
    add_index :professions, :group_id
  end
end
