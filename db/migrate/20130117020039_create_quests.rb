class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.integer :encounters_count, :default => 0, :null => false
      t.integer :position
      t.string :act
      t.boolean :official_release, :default => false, :null => false
      t.integer :campaign_id
      t.integer :user_id, :null => false
      t.boolean :is_official, :default => false, :null => false
      t.timestamps
    end

    add_index :quests, :name, :unique => true
    add_index :quests, :slug, :unique => true
    add_index :quests, :campaign_id
  end
end
