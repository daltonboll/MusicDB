json.array!(@spotify_songs) do |spotify_song|
  json.extract! spotify_song, :id, :spotifyID, :spotifyAlbumID, :spotifyArtistID, :discNumber, :durationMS, :explicit, :title, :popularity, :trackNumber
  json.url spotify_song_url(spotify_song, format: :json)
end
