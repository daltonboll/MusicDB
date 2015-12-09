json.array!(@songs) do |song|
  json.extract! song, :id, :title, :billboardHot100Peak, :radioPlayPeak, :spotifyStreams, :hasMusicVideo, :isSingle, :amountSold
  json.url song_url(song, format: :json)
end
