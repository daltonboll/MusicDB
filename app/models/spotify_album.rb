# == Schema Information
#
# Table name: spotify_albums
#
#  id                   :integer          not null, primary key
#  spotifyID            :string
#  albumType            :string
#  spotifyArtistID      :string
#  genres               :string           default([]), is an Array
#  images               :string           default([]), is an Array
#  title                :string
#  popularity           :integer
#  releaseDate          :string
#  releaseDatePrecision :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class SpotifyAlbum < ActiveRecord::Base
  validates :spotifyID, uniqueness: true
  require 'rspotify'

  def self.get_spotify_albums
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    count = 0
    max_count = 1000
    spotify_artists = SpotifyArtist.all

    spotify_artists.each do |spotify_artist|
      if count >= max_count
        RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]) # re-authenticate
        count = 0
      end

      spotify_artist_id = spotify_artist.spotifyID
      puts "Getting info for artist with id: #{spotify_artist_id}"
      artist = RSpotify::Artist.find(spotify_artist_id)

      if artist.nil?
        puts "We couldn't find the artist with id #{spotify_artist_id}"
      else
        albums = artist.albums

        if albums.nil?
          puts "The artist with id #{spotify_artist_id} has no albums"
        else
          albums.each do |album|
            spotifyID = album.id

            if not SpotifyAlbum.find_by(spotifyID: spotifyID).nil?
              puts "WE ALREADY HAVE DATA FOR ALBUM #{spotifyID}"
            else
              albumType = album.album_type
              spotifyArtistID = spotify_artist_id
              genres = album.genres
              images_hash = album.images
              title = album.name
              popularity = album.popularity
              releaseDate = album.release_date
              releaseDatePrecision = album.release_date_precision

              # Only grab the urls of the images
              images = []
              images_hash.each do |image_hash|
                url = image_hash["url"]
                images << url
              end

              album_hash = { title: title, albumType: albumType, spotifyArtistID: spotifyArtistID, releaseDate: releaseDate, releaseDatePrecision: releaseDatePrecision, popularity: popularity, spotifyID: spotifyID, images: images, genres: genres }
              new_album = SpotifyAlbum.create(album_hash)
              new_album.save
            end
          end
        end
      end
      # sleep(0.01)
    end
    return true
  end

end
