class RemoveGenreColumnFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :genre
  end
end
