class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name, :null => false
      t.string :trait1_id
      t.string :trait2_id

      t.integer :num_tan2
      t.integer :num_red2
      t.integer :num_tan3
      t.integer :num_red3
      t.integer :num_tan4
      t.integer :num_red4

      t.string :act1_tan_attack
      t.string :act2_red_attack

      t.string :act1_tan_speed
      t.string :act1_red_speed
      t.string :act2_tan_speed
      t.string :act2_red_speed

      t.string :act1_tan_health
      t.string :act1_red_health
      t.string :act2_tan_health
      t.string :act2_red_health

      t.string :act1_tan_defense
      t.string :act1_red_defense
      t.string :act2_tan_defense
      t.string :act2_red_defense

      t.string :role, :null => false, :default => "Monster"
      t.string :attack_type, :null => false, :default => "Melee"
      t.integer :game_id, :null => false

      t.timestamps
    end

  add_index :monsters, :trait1_id
  add_index :monsters, :trait2_id
  add_index :monsters, :game_id
  
  end
end
