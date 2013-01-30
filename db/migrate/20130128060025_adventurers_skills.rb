class AdventurersSkills < ActiveRecord::Migration
  def change
    create_table :adventurers_skills do |t|
      t.integer :skill_id, :null => false
      t.integer :adventurer_id, :null => false
    end

    add_index :adventurers_skills, :skill_id
    add_index :adventurers_skills, :adventurer_id
  end

end