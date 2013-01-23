class CreateFamiliars < ActiveRecord::Migration
  def change
    create_table :familiars do |t|
      t.string :name, :null => false
      t.integer :speed
      t.integer :health
      t.string :defense
      t.string :rule1, :null => false
      t.string :rule2
      t.string :rule3
      t.string :rule4
      t.string :attack_type
      t.string :dice
      t.integer :game_id
      t.integer :hero_id
      t.integer :profession_id
    end

    add_index :familiars, :game_id
    add_index :familiars, :hero_id
    add_index :familiars, :profession_id
  end
end
