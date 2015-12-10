class AddColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :discNumber, :integer
    add_column :songs, :spotifyArtistID, :string
    add_column :songs, :spotifyAlbumID, :string
    add_column :songs, :durationMS, :integer
    add_column :songs, :explicit, :boolean
    add_column :songs, :trackNumber, :integer
  end
end
