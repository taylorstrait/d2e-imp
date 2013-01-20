class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      
      # SHARED PROPERTIES
      t.string :name, :null => false
      t.string :role, :null => false, :default => "Monster"
      t.string :attack_type, :null => false, :default => "Melee"
      t.integer :game_id, :null => false


      # MONSTER PROPERTIES
      t.integer :num_tan2
      t.integer :num_red2
      t.integer :num_tan3
      t.integer :num_red3
      t.integer :num_tan4
      t.integer :num_red4

      t.string :act1_tan_attack
      t.string :act2_tan_attack
      t.string :act1_red_attack
      t.string :act2_red_attack

      t.integer :act1_tan_speed
      t.integer :act1_red_speed
      t.integer :act2_tan_speed
      t.integer :act2_red_speed

      t.integer :act1_tan_health
      t.integer :act1_red_health
      t.integer :act2_tan_health
      t.integer :act2_red_health

      t.string :act1_tan_defense
      t.string :act1_red_defense
      t.string :act2_tan_defense
      t.string :act2_red_defense


      # LIEUTENANT PROPERTIES
      t.integer :act1_2p_lt_speed
      t.integer :act1_3p_lt_speed
      t.integer :act1_4p_lt_speed

      t.integer :act1_2p_lt_health
      t.integer :act1_2p_lt_health
      t.integer :act1_4p_lt_health

      t.string :act1_2p_lt_defense
      t.string :act1_3p_lt_defense
      t.string :act1_4p_lt_defense

      t.string :act1_lt_attack
      t.string :act2_lt_attack

      t.integer :might
      t.integer :knowledge
      t.integer :willpower
      t.integer :awareness

    end

  add_index :monsters, :game_id
  
  end
end
