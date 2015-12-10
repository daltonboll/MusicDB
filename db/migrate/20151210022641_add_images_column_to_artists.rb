class AddImagesColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :images, :string, array: true, default: []
  end
end
