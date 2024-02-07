class AddToVideoIdToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :video_id, :integer
  end
end
