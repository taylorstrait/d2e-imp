class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name, :null => false
      t.integer :game_id
      t.string :archetype, :null => false
      t.integer :speed, :null => false
      t.integer :health, :null => false
      t.integer :stamina, :null => false
      t.string :defense, :null => false, :default => "grey"
      t.integer :might, :null => false
      t.integer :knowledge, :null => false
      t.integer :willpower, :null => false
      t.integer :awareness, :null => false
      t.text :ability
      t.text :feat
    end
  end
end