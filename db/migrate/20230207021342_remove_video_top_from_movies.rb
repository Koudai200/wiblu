class RemoveVideoTopFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :video_top, :string
    add_column :movies, :video, :string
  end
end
