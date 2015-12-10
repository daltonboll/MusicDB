class CreateSpotifyAlbums < ActiveRecord::Migration
  def change
    create_table :spotify_albums do |t|
      t.string :spotifyID
      t.string :albumType
      t.string :spotifyArtistID
      t.string :genres, array: true, default: []
      t.string :images, array: true, default: []
      t.string :title
      t.integer :popularity
      t.string :releaseDate
      t.string :releaseDatePrecision

      t.timestamps null: false
    end
  end
end
