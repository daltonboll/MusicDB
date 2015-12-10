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
    max_count = 1000
    spotify_albums = SpotifyAlbum.all

    spotify_albums.each do |spotify_album|
      if count >= max_count
        RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]) # re-authenticate
        count = 0
      end
      
      spotify_artist_id = spotify_album.spotifyArtistID
      spotify_album_id = spotify_album.spotifyID

      puts "Getting info for songs with artist id: #{spotify_artist_id} and album id: #{spotify_album_id}"
      album = RSpotify::Album.find(spotify_album_id)

      if album.nil?
        puts "We couldn't find the album with id #{spotify_album_id}"
      else
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
              new_album = SpotifyAlbum.create(album_hash)
              new_album.save
            end
          end
        end
      end
      #sleep(0.1)
    end
    return true
  end

end
