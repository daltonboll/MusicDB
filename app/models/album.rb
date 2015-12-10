# == Schema Information
#
# Table name: albums
#
#  id                   :integer          not null, primary key
#  title                :text
#  amountSold           :integer
#  billboard200Peak     :integer
#  numberOfSingles      :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  artist_id            :integer
#  genres               :string           default([]), is an Array
#  images               :string           default([]), is an Array
#  popularity           :integer          default(0)
#  spotifyID            :string
#  releaseDate          :string
#  albumType            :string
#  releaseDatePrecision :string
#  spotifyArtistID      :string
#

class Album < ActiveRecord::Base
  belongs_to :artist # An Album belongs to an Artist
  has_many :songs # An Album has many Songs
  has_many :awards # An Album has many Awards
  validates :spotifyID, uniqueness: true

  def self.convert_spotify_data
    Album.delete_all
    spotify_albums = SpotifyAlbum.all

    spotify_albums.each do |s_album|
      title = s_album.title
      genres = s_album.genres
      images = s_album.images
      spotifyID = s_album.spotifyID
      spotifyArtistID = s_album.spotifyArtistID
      popularity = s_album.popularity
      releaseDate = s_album.releaseDate
      albumType = s_album.albumType
      releaseDatePrecision = s_album.releaseDatePrecision

      artist = Artist.find_by(spotifyID: spotifyArtistID)
      if not artist.nil?
        album_hash = { title: title, genres: genres, images: images, spotifyID: spotifyID, spotifyArtistID: spotifyArtistID, popularity: popularity, releaseDate: releaseDate, albumType: albumType, releaseDatePrecision: releaseDatePrecision }
        album = Album.create(album_hash)
        album.save
        album.artist = artist
        album.save
      else 
        puts "WE HAVE NO ARTIST WITH ID #{spotifyArtistID}"
      end
    end

  end

end
