class CreateArchetypes < ActiveRecord::Migration
  def change
    create_table :archetypes do |t|
      t.string :name, :null => false
      t.string :logo_url
      t.integer :game_id
      t.timestamps
    end

  add_index :archetypes, :game_id
  
  end
end
