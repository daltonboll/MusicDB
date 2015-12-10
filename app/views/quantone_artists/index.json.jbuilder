json.array!(@quantone_artists) do |quantone_artist|
  json.extract! quantone_artist, :id, :quantoneID, :stageName, :artistType, :gender, :imageId, :spotifyId, :birthDate, :birthPlace, :deathDate, :deathPlace, :legalName, :age, :homeCountry, :homeRegion, :race, :debutYear
  json.url quantone_artist_url(quantone_artist, format: :json)
end
