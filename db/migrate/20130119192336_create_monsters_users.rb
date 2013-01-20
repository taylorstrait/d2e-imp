class CreateMonstersUsers < ActiveRecord::Migration
  def change
    create_table :monsters_users do |t|
      t.integer :monster_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :monsters_users, :monster_id
    add_index :monsters_users, :user_id
  end
end
