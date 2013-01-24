class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :archetype_id, :null => false
      t.integer :game_id
      t.text :description
    end

    add_index :professions, :name, :unique => true
    add_index :professions, :slug, :unique => true
    add_index :professions, :archetype_id
    add_index :professions, :game_id
  end
end
