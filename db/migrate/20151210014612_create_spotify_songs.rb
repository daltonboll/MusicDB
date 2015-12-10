class CreateSpotifySongs < ActiveRecord::Migration
  def change
    create_table :spotify_songs do |t|
      t.string :spotifyID
      t.string :spotifyAlbumID
      t.string :spotifyArtistID
      t.integer :discNumber
      t.integer :durationMS
      t.boolean :explicit
      t.string :title
      t.integer :popularity
      t.integer :trackNumber

      t.timestamps null: false
    end
  end
end
