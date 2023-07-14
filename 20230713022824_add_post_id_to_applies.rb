class AddPostIdToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :post_id, :integer
  end
end
