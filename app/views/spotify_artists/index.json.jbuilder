json.array!(@spotify_artists) do |spotify_artist|
  json.extract! spotify_artist, :id, :name, :spotifyID, :images, :popularity, :genres
  json.url spotify_artist_url(spotify_artist, format: :json)
end
