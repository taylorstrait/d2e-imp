class HeroesUsers < ActiveRecord::Migration
  def change
    create_table :heroes_users do |t|
      t.integer :hero_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :heroes_users, :hero_id
    add_index :heroes_users, :user_id
    add_index :heroes_users, [:user_id, :hero_id], :unique => true
  end
end
