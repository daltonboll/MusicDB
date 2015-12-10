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
#  artistName          :string
#  albumName           :string
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
          album.save
        end
      else
        puts "THE SONG WITH ID #{spotifyID} HAS NO ALBUM OR ARTIST IN THE DB"
      end
    end
  end

  def self.update_artist_names
    songs = Song.all
    songs.each do |song|
      artist = song.artist.name
      song.artistName = artist
      song.save
    end
  end

  def self.update_album_names
    songs = Song.all
    songs.each do |song|
      album = song.album.title
      song.albumName = album
      song.save
    end
  end

  def get_track_number
    track_number = self.trackNumber

    if track_number.size.nil?
      return 0
    else
      return track_number
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

  def get_popularity
    popularity = self.popularity

    if popularity.nil?
      return 0
    else
      return popularity
    end
  end

  def get_disc_number
    disc_number = self.discNumber

    if disc_number.nil?
      return 1
    else
      return disc_number
    end
  end

  def get_explicit
    explicit = self.explicit

    if explicit
      return "Yes"
    else
      return "No"
    end
  end

  def get_spotify_url
    base = "https://play.spotify.com/track/"
    spotify_id = self.spotifyID

    if spotify_id.nil?
      return "#"
    else
      return base + self.spotifyID
    end
  end

  def get_duration
    duration = self.durationMS

    if duration.nil?
      return "?"
    else
      # TODO: convert this to readable format
      return duration 
    end
  end

  def get_release_date
    return self.album.get_release_date
  end

  def get_truncated_title
    title = self.title

    if title.size > 32
      truncation = title[0,32] + "..."
      return truncation
    else
      return title
    end
  end

end
