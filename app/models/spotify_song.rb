# == Schema Information
#
# Table name: spotify_songs
#
#  id              :integer          not null, primary key
#  spotifyID       :string
#  spotifyAlbumID  :string
#  spotifyArtistID :string
#  discNumber      :integer
#  durationMS      :integer
#  explicit        :boolean
#  title           :string
#  popularity      :integer
#  trackNumber     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SpotifySong < ActiveRecord::Base
  validates :spotifyID, uniqueness: true
  require 'rspotify'

  def self.get_spotify_songs
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    count = 0
    max_count = 20
    current_index = 0
    spotify_albums = Album.where("id >= #{current_index}")

    while not spotify_albums.empty?
      puts "CURRENT INDEX = #{current_index}"
      if count >= max_count
        RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]) # re-authenticate
        count = 0
      end

      count += 1
      spotify_albums = Album.where("id >= #{current_index}").first(20)
      current_index += 20
      ids = []

      spotify_albums.each do |s_album|
        ids.append(s_album.spotifyID)
      end

      albums = RSpotify::Album.find(ids)

      albums.each do |album|
        spotify_album_id = album.id
        spotify_album_object = Album.find_by(spotifyID: spotify_album_id)

        if spotify_album_object.nil?
          puts "We couldn't find the album with id #{spotify_album_id}"
          next
        end

        spotify_artist_object = spotify_album_object.artist

        if spotify_artist_object.nil?
          puts "We couldn't find the artist associated with the album id #{spotify_album_id}"
          next
        end

        spotify_artist_id = spotify_artist_object.spotifyID
        songs = album.tracks

        if songs.nil?
          puts "The album with id #{spotify_album_id} has no songs"
        else
          songs.each do |song|
            spotifyID = song.id

            if not SpotifySong.find_by(spotifyID: spotifyID).nil?
              puts "WE ALREADY HAVE DATA FOR SONG #{spotifyID}"
            else
              spotifyArtistID = spotify_artist_id
              spotifyAlbumID = spotify_album_id
              discNumber = song.disc_number
              durationMS = song.duration_ms
              explicit = song.explicit
              title = song.name
              popularity = song.popularity
              trackNumber = song.track_number

              song_hash = { spotifyID: spotifyID, spotifyArtistID: spotifyArtistID, spotifyAlbumID: spotifyAlbumID, discNumber: discNumber, durationMS: durationMS, explicit: explicit, title: title, popularity: popularity, trackNumber: trackNumber }
              new_song = SpotifySong.create(song_hash)
              new_song.save
            end
          end
        end
      end
      # sleep(20)
    end
    return true
  end

end
