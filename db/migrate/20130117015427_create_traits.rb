class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name, :null => false
      t.string :image

      t.timestamps
    end
  end
end
