class AddImagesColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :images, :string, array: true, default: []
  end
end
