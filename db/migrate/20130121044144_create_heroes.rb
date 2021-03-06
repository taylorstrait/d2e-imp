class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :game_id
      t.integer :archetype_id, :null => false
      t.integer :speed, :null => false
      t.integer :health, :null => false
      t.integer :stamina, :null => false
      t.string :defense, :null => false, :default => "{GREY}"
      t.integer :might, :null => false
      t.integer :knowledge, :null => false
      t.integer :willpower, :null => false
      t.integer :awareness, :null => false
      t.text :ability
      t.text :feat
      t.integer :user_id, :null => false
      t.boolean :is_official, :default => false, :null => false
      t.boolean :is_published, :default => false, :null => false
      t.text :description
      t.integer :group_id
      t.timestamps
    end

    add_index :heroes, :name, :unique => true
    add_index :heroes, :slug, :unique => true
    add_index :heroes, :archetype_id
    add_index :heroes, :user_id
    add_index :heroes, :game_id
    add_index :heroes, :group_id
  end
end