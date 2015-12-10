class CreateSpotifyArtists < ActiveRecord::Migration
  def change
    create_table :spotify_artists do |t|
      t.string :name
      t.string :spotifyID
      t.string :images, array: true, default: []
      t.integer :popularity
      t.string :genres, array: true, default: []

      t.timestamps null: false
    end
  end
end
