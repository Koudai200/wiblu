class AddContentToMusics < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :content, :text
  end
end
