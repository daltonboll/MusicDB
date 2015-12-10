class AddArtistNameToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :artistName, :string
  end
end
