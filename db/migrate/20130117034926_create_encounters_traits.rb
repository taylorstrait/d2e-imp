class CreateEncountersTraits < ActiveRecord::Migration
  def change
    create_table :encounters_traits do |t|
      t.integer :encounter_id, :null => false
      t.integer :trait_id, :null => false
    end

    add_index :encounters_traits, :encounter_id
    add_index :encounters_traits, :trait_id
  end
end
