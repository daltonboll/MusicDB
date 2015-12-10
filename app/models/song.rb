# == Schema Information
#
# Table name: songs
#
#  id                  :integer          not null, primary key
#  title               :text
#  billboardHot100Peak :integer
#  radioPlayPeak       :integer
#  spotifyStreams      :integer
#  hasMusicVideo       :boolean
#  isSingle            :boolean
#  amountSold          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  artist_id           :integer
#  album_id            :integer
#  popularity          :integer          default(0)
#  spotifyID           :string
#  discNumber          :integer
#  spotifyArtistID     :string
#  spotifyAlbumID      :string
#  durationMS          :integer
#  explicit            :boolean
#  trackNumber         :integer
#

class Song < ActiveRecord::Base
  belongs_to :artist # A Song belongs to an Artist
  belongs_to :album # A slong belongs to an Album
  validates :spotifyID, uniqueness: true

  def self.convert_spotify_data
    spotify_songs = SpotifySong.all

    spotify_songs.each do |s_song|
      spotifyID = s_song.spotifyID
      spotifyArtistID = s_song.spotifyArtistID
      spotifyAlbumID = s_song.spotifyAlbumID
      artist = Artist.find_by(spotifyID: spotifyArtistID)
      album = Album.find_by(spotifyID: spotifyAlbumID)

      if not artist.nil? and not album.nil?
        discNumber = s_song.discNumber
        durationMS = s_song.durationMS
        explicit = s_song.explicit
        title = s_song.title
        popularity = s_song.popularity
        trackNumber = s_song.trackNumber

        song_hash = { spotifyID: spotifyID, spotifyArtistID: spotifyArtistID, spotifyAlbumID: spotifyAlbumID, discNumber: discNumber, durationMS: durationMS, explicit: explicit, title: title, popularity: popularity, trackNumber: trackNumber }
        song = Song.create(song_hash)

        if song.save
          artist.songs << song
          artist.save
          album.songs << song
          album.song
        end
      else
        puts "THE SONG WITH ID #{spotifyID} HAS NO ALBUM OR ARTIST IN THE DB"
      end
    end
  end

end
