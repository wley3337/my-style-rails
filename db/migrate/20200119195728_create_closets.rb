class CreateClosets < ActiveRecord::Migration[6.0]
  def change
    create_table :closets do |t|

      t.timestamps
    end
  end
end
