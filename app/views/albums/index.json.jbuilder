json.array!(@albums) do |album|
  json.extract! album, :id, :title, :releaseDate, :genre, :amountSold, :billboard200Peak, :numberOfSingles
  json.url album_url(album, format: :json)
end
