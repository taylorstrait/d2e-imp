class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name, :null => false
      t.integer :quest_id, :null => false
      t.integer :position, :null => false, :default => 1
      t.text :description
      t.text :introduction
      t.text :setup
      t.text :special_rules
      t.text :reinforcements
      t.text :victory
      t.text :rewards
      t.integer :num_open_groups, :default => 0, :null => false
      t.timestamps
    end

    add_index :encounters, :position
    add_index :encounters, :quest_id
  end
end
