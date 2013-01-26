class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :profession_id, :null => false
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :xp_cost, :null => false, :default => 0
      t.string :rule1, :null => false
      t.string :rule2
      t.string :rule3
      t.string :rule4
      t.integer :fatigue_cost, :null => false, :default => 0
    end

    add_index :skills, :name, :unique => true
    add_index :skills, :slug, :unique => true
    add_index :skills, :profession_id
  end
end
