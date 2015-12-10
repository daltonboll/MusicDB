class AddGenresColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :genres, :string, array: true, default: []
  end
end
