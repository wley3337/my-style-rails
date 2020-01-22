class CreateOutfitSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_seasons do |t|
      t.integer :season_id
      t.integer :outfit_id
      t.timestamps
    end
  end
end
