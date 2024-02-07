class AddMovieIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :movie_id, :integer
  end
end
