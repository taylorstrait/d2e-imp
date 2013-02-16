class AdventuresOverlordCards < ActiveRecord::Migration
  def change
    create_table :adventures_overlord_cards do |t|
      t.integer :overlord_card_id, :null => false
      t.integer :adventure_id, :null => false
    end

    add_index :adventures_overlord_cards, :overlord_card_id
    add_index :adventures_overlord_cards, :adventure_id
    add_index :adventures_overlord_cards, [:adventure_id, :overlord_card_id], :unique => true

  end

end