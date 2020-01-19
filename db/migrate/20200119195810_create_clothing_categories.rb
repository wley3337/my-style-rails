class CreateClothingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_categories do |t|

      t.timestamps
    end
  end
end
