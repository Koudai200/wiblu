class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|

      t.integer "user_id"
      t.integer "music_id"
      t.integer "movie_id"
      t.integer "image_id"


      t.timestamps
    end
  end
end
