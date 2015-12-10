class AddExtraColumnsToAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :releaseDate
    add_column :albums, :releaseDate, :string
    add_column :albums, :albumType, :string
    add_column :albums, :releaseDatePrecision, :string
    add_column :albums, :spotifyArtistID, :string
  end
end
