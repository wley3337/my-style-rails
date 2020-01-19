class CreateClothingTags < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_tags do |t|

      t.timestamps
    end
  end
end
