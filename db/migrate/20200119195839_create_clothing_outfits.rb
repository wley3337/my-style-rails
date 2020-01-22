class CreateClothingOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_outfits do |t|
      t.integer :clothing_item_id
      t.integer :outfit_id
      t.timestamps
    end
  end
end
