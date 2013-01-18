class CreateEncountersMonsters < ActiveRecord::Migration
  def change
    create_table :encounters_monsters do |t|
      t.integer :encounter_id, :null => false
      t.integer :monster_id, :null => false
    end

    add_index :encounters_monsters, :encounter_id
    add_index :encounters_monsters, :monster_id
  end
end
