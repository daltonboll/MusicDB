class AddArtistNameToSong < ActiveRecord::Migration
  def change
    add_column :songs, :artistName, :string
    add_column :songs, :albumName, :string
  end
end
