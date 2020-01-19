class CreateClothingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_items do |t|

      t.timestamps
    end
  end
end
