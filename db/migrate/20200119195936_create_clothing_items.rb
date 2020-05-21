class CreateClothingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_items do |t|
      t.integer :closet_id
      t.string :title
      t.string :img_url
      t.timestamps
    end
  end
end
