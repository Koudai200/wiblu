class AddMusicIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :music_id, :integer
  end
end
