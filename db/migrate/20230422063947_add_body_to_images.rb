class AddBodyToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :body, :text
  end
end
