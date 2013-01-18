class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name, :null => false
      t.integer :quests_count, :default => 0, :null => false
      t.integer :game_id

      t.timestamps
    end

    add_index :campaigns, :game_id
  end
end
