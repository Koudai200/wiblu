class AddImageIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :image_id, :integer
  end
end
