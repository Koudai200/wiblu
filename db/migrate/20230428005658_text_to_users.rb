class TextToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :text, :text
  end
end
