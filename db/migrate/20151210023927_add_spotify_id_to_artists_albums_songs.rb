class AddSpotifyIdToArtistsAlbumsSongs < ActiveRecord::Migration
  def change
    add_column :artists, :spotifyID, :string
    add_column :albums, :spotifyID, :string
    add_column :songs, :spotifyID, :string
  end
end
