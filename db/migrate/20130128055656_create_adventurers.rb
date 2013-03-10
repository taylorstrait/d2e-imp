class CreateAdventurers < ActiveRecord::Migration
  def change
    create_table :adventurers do |t|
      t.integer :hero_id, :null => false
      t.integer :adventure_id
      t.integer :profession_id, :null => false
      t.integer :available_xp, :null => false, :default => 0
      t.integer :user_id
      t.integer :current_damage, :default => 0, :null => false
      t.integer :current_fatigue, :default => 0, :null => false
      t.timestamps
    end

    add_index :adventurers, :hero_id
    add_index :adventurers, :profession_id
    add_index :adventurers, :user_id
    add_index :adventurers, :adventure_id
  end
end
