class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name, :null => false
      t.integer :quest_id, :null => false
      t.integer :position, :null => false, :default => 1
      t.integer :num_open_groups, :default => 0, :null => false
      t.timestamps
    end

    add_index :encounters, :quest_id
  end
end
