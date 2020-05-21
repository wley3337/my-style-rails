class CreateWorns < ActiveRecord::Migration[6.0]
  def change
    create_table :worns do |t|
      t.integer :outfit_id
      t.datetime :date_worn
      t.timestamps
    end
  end
end
