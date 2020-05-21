class CreateClothingTags < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_tags do |t|
      t.integer :clothing_item_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
