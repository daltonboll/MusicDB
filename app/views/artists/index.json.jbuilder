json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :age, :homeCountry, :homeState, :gender, :race, :debutYear
  json.url artist_url(artist, format: :json)
end
