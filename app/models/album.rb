# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  title            :text
#  releaseDate      :integer
#  amountSold       :integer
#  billboard200Peak :integer
#  numberOfSingles  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  artist_id        :integer
#  genres           :string           default([]), is an Array
#  images           :string           default([]), is an Array
#  popularity       :integer          default(0)
#

class Album < ActiveRecord::Base
  belongs_to :artist # An Album belongs to an Artist
  has_many :songs # An Album has many Songs
  has_many :awards # An Album has many Awards

  def self.convert_spotify_data
    spotify_albums = SpotifyAlbum.all

    spotify_albums.each do |s_album|
      title = s_album.title
      genres = s_album.genres
      images = s_album.images
      spotify_artist_id = s_album.spotifyArtistID
      
      


    end

  end

end
