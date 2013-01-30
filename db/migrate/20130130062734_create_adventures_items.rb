class CreateAdventuresItems < ActiveRecord::Migration
  def change
    create_table :adventures_items do |t|
      t.integer :item_id, :null => false
      t.integer :adventure_id, :null => false
    end

    add_index :adventures_items, :item_id
    add_index :adventures_items, :adventure_id
  end

end
