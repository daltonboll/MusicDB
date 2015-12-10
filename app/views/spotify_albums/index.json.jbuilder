json.array!(@spotify_albums) do |spotify_album|
  json.extract! spotify_album, :id, :spotifyID, :albumType, :spotifyArtistID, :genres, :images, :title, :popularity, :releaseDate, :releaseDatePrecision
  json.url spotify_album_url(spotify_album, format: :json)
end
