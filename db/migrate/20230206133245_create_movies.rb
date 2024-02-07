class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.text :body
      t.string :video_top
      t.string :file

      t.timestamps
    end
  end
end
