class AddCtypeToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :ctype, :string
    add_column :images, :data, :binary
  end
end
