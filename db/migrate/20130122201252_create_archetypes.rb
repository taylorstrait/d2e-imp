class CreateArchetypes < ActiveRecord::Migration
  def change
    create_table :archetypes do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.string :logo_url
      t.integer :game_id
      t.text :description
    end

  add_index :archetypes, :name, :unique => true
  add_index :archetypes, :slug, :unique => true
  add_index :archetypes, :game_id
  
  end
end
