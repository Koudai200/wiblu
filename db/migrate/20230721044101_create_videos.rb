class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.text :body
      t.string :file
      t.string :video
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
