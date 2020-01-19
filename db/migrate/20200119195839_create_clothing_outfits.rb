class CreateClothingOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_outfits do |t|

      t.timestamps
    end
  end
end
