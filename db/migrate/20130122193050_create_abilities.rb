class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.integer :profession_id, :null => false
      t.string :name, :null => false
      t.integer :xp_cost, :null => false, :default => 0
      t.string :rule1, :null => false
      t.string :rule2
      t.string :rule3
      t.string :rule4
      t.integer :fatigue_cost, :null => false, :default => 0
    end

    add_index :abilities, :profession_id
  end
end
