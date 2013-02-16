class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.integer :game_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :games_users, :game_id
    add_index :games_users, :user_id
    add_index :games_users, [:user_id, :game_id], :unique => true
  end
end
