class CreateMonstersTraits < ActiveRecord::Migration
  def change
    create_table :monsters_traits do |t|
      t.integer :monster_id, :null => false
      t.integer :trait_id, :null => false
    end

    add_index :monsters_traits, :monster_id
    add_index :monsters_traits, :trait_id
  end
end
