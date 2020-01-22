class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.string :season
      t.boolean :casual
      t.integer :user_id
      t.timestamps
    end
  end
end
