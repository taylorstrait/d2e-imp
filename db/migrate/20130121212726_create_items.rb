class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.string :attack_type
      t.string :subclass1, :null => false
      t.string :subclass2
      t.string :equip_type, :null => false
      t.string :dice
      t.integer :buy_cost, :null => false, :default => 0
      t.integer :sell_cost, :null => false, :default => 0
      t.string :trait1
      t.string :trait2
      t.string :trait3
      t.string :trait4
      t.string :rules
      t.string :category, :default => "shop_item_a1", :null => false
      t.integer :profession_id
      t.integer :game_id, :null => false
    end

  add_index :items, :game_id

  end
end
