class AddFileToMusics < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :file, :string
  end
end
