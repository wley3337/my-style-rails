class CreateClothingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_categories do |t|
      t.integer :clothing_item_id
      t.integer :category_id
      t.timestamps
    end
  end
end
