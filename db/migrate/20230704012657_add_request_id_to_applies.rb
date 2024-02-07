class AddRequestIdToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :request_id, :integer
  end
end
