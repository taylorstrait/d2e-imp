class UpdateAdventurerStats < ActiveRecord::Migration
  def up
    add_column :adventurers, :current_health, :integer, :null => false, :default => 0
    add_column :adventurers, :current_stamina, :integer, :null => false, :default => 0
    remove_column :adventurers, :current_damage
    remove_column :adventurers, :current_fatigue
  end

  def down
    remove_column :adventurers, :current_health
    remove_column :adventurers, :current_stamina
    add_column :adventurers, :current_damage, :integer, :null => false, :default => 0
    add_column :adventurers, :current_fatigue, :integer, :null => false, :default => 0
  end
end
