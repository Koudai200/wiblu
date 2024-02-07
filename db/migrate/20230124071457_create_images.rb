class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|

      t.string "image_name"
      t.string "name"

      t.timestamps
    end
  end
end
