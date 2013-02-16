class AdventurersItems < ActiveRecord::Migration
  def change
    create_table :adventurers_items do |t|
      t.integer :item_id, :null => false
      t.integer :adventurer_id, :null => false
    end

    add_index :adventurers_items, :item_id
    add_index :adventurers_items, :adventurer_id
    add_index :adventurers_items, [:adventurer_id, :item_id], :unique => true
  end

end