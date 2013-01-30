class CreateAdventurersAdventures < ActiveRecord::Migration
  def change
    create_table :adventurers_adventures do |t|
      t.integer :adventure_id, :null => false
      t.integer :adventurer_id, :null => false
    end

    add_index :adventurers_adventures, :adventure_id
    add_index :adventurers_adventures, :adventurer_id
  end

end