class CreateAdventurers < ActiveRecord::Migration
  def change
    create_table :adventurers do |t|
      t.integer :hero_id, :null => false
      t.integer :profession_id, :null => false
      t.integer :available_xp, :null => false, :default => 0
      t.integer :user_id
    end

    add_index :adventurers, :hero_id
    add_index :adventurers, :profession_id
    add_index :adventurers, :user_id
  end
end
