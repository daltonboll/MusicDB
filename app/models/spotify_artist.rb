# == Schema Information
#
# Table name: spotify_artists
#
#  id         :integer          not null, primary key
#  name       :string
#  spotifyID  :string
#  images     :string           default([]), is an Array
#  popularity :integer
#  genres     :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpotifyArtist < ActiveRecord::Base
  validates :name, :spotifyID, uniqueness: true
  require 'rspotify'

  def self.get_spotify_artists
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    artists = Artist.all

    artists.each do |artist|
      search_name = artist.name
      puts "Getting info for artist: #{search_name}"

      if not SpotifyArtist.find_by(name: search_name).nil?
        puts "WE ALREADY HAVE DATA FOR #{search_name}"
      else
        spotify_artists = RSpotify::Artist.search(search_name)
        spotify_artist = spotify_artists.first

        if spotify_artist.nil?
          puts "NO ARTISTS WERE FOUND WITH THE NAME #{search_name}"
        else
          spotifyID = spotify_artist.id
          popularity = spotify_artist.popularity
          images_hash = spotify_artist.images
          genres = spotify_artist.genres
          name = spotify_artist.name

          # Only grab the urls of the images
          images = []
          images_hash.each do |image_hash|
            url = image_hash["url"]
            images << url
          end

          artist_hash = { name: name, popularity: popularity, spotifyID: spotifyID, images: images, genres: genres }
          new_artist = SpotifyArtist.create(artist_hash)
          new_artist.save
        end
        sleep(0.2)
      end
    end

    return true
  end

end
