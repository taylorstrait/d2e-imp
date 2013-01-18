class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name, :null => false
      t.integer :encounters_count, :default => 0, :null => false
      t.integer :page
      t.integer :position
      t.integer :act
      t.integer :campaign_id
      t.timestamps
    end

    add_index :quests, :campaign_id
  end
end
