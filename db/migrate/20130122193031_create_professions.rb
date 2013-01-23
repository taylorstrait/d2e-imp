class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name, :null => false
      t.integer :archetype_id, :null => false
      t.integer :game_id
    end

    add_index :professions, :archetype_id
    add_index :professions, :game_id
  end
end
