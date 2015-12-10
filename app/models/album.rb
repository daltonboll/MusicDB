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
#  artistName           :string
#

class Album < ActiveRecord::Base
  belongs_to :artist # An Album belongs to an Artist
  has_many :songs # An Album has many Songs
  has_many :awards # An Album has many Awards
  validates :spotifyID, uniqueness: true

  def self.convert_spotify_data
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
        
        if album.save
          artist.albums << album
          artist.save
        end
      else 
        puts "WE HAVE NO ARTIST WITH ID #{spotifyArtistID}"
      end
    end
  end

  def self.update_artist_names
    albums = Album.all
    albums.each do |album|
      artist = album.artist.name
      album.artistName = artist
      album.save
    end
  end

  def calculate_year
    date = self.releaseDate
    precision = self.releaseDatePrecision

    if precision == "year" or precision == "month" or precision == "day"
      return date[0, 4]
    else
      return "N/a"
    end
  end

  def get_release_date
    date = self.releaseDate

    if date.nil?
      return "N/a"
    else
      return date
    end
  end

  def get_popularity
    popularity = self.popularity

    if popularity.nil?
      return 0
    else
      return popularity
    end
  end

  def get_genres
    genres = self.genres
    genre_text = ""

    genres.each do |genre|
      genre_text += genre.titleize + ", "
    end

    len = genre_text.size

    if len > 0
      genre_text = genre_text[0, len-2]
    end
    
    return genre_text
  end

  def get_genres_for_bio
    genre_text = self.get_genres

    if genre_text.size == 0
      return "No associated genres"
    else
      return genre_text
    end
  end

  def get_album_type
    type = self.albumType

    if type.nil?
      return "Album"
    else
      return type.titleize
    end
  end

  def get_spotify_id
    spotify_id = self.spotifyID

    if spotify_id.nil?
      return "N/a"
    else
      return spotify_id
    end
  end

  def get_spotify_url
    base = "https://play.spotify.com/album/"
    spotify_id = self.spotifyID

    if spotify_id.nil?
      return "#"
    else
      return base + self.spotifyID
    end
  end

end
