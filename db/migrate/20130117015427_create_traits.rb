class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.string :image

      t.timestamps
    end

    add_index :traits, :name, :unique => true
    add_index :traits, :slug, :unique => true
  end
end
