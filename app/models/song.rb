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
  validates :billboardHot100Peak, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :radioPlayPeak, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :spotifyStreams, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :amountSold, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :popularity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :discNumber, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :durationMS, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :trackNumber, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

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

    if track_number.nil?
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

  def get_is_single
    isSingle = self.isSingle

    if isSingle
      return "Yes"
    else
      return "No"
    end
  end

  def get_has_music_video
    has_music_video = self.hasMusicVideo

    if has_music_video
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
      total_seconds = duration / 1000
      minutes = total_seconds / 60
      leftover_seconds = total_seconds % 60
      if leftover_seconds < 10
        return "#{minutes}:0#{leftover_seconds}"
      else
        return "#{minutes}:#{leftover_seconds}"
      end
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

  def get_album_id
    album = self.album
    if not album.nil?
      return album.id
    else
      return -1
    end
  end

  def self.generate_billboard_peaks
    list_of_peaks = (1..100).to_a
    num_peaks = list_of_peaks.size - 1
    songs = Song.all

    songs.each do |song|
      peak = list_of_peaks[Random.rand(0..num_peaks)]
      song.billboardHot100Peak = peak
      song.save
    end
  end

  def self.generate_data
    songs = Song.all
    songs.each do |song|
      radioPlayPeak = Song.generate_radio_peak
      spotifyStreams = Song.generate_spotify_streams
      amountSold = Song.generate_sales
      isSingle = Song.generate_is_single
      hasMusicVideo = Song.generate_has_music_video

      song.radioPlayPeak = radioPlayPeak
      song.spotifyStreams = spotifyStreams
      song.amountSold = amountSold
      song.isSingle = isSingle
      song.hasMusicVideo = hasMusicVideo

      song.save
    end
  end

  def self.generate_radio_peak
    list_of_peaks = (1..100).to_a
    num_peaks = list_of_peaks.size - 1
    peak = list_of_peaks[Random.rand(0..num_peaks)]
    return peak
  end

  def self.generate_spotify_streams
    list_of_streams = (1..250).to_a
    num_streams = list_of_streams.size - 1
    weight = 1000000
    streams = list_of_streams[Random.rand(0..num_streams)] * weight
    return streams
  end

  def self.generate_sales
    list_of_sales = (1..250).to_a
    num_sales = list_of_sales.size - 1
    weight = 10000
    sales = list_of_sales[Random.rand(0..num_sales)] * weight
    return sales
  end

  def self.generate_is_single
    options = [false, false, true, false, false]
    num_options = options.size - 1
    option = options[Random.rand(0..num_options)]
    return option
  end

  def self.generate_has_music_video
    options = [false, false, true, false, false]
    num_options = options.size - 1
    option = options[Random.rand(0..num_options)]
    return option
  end

  def self.get_all_songs
    if Rails.env.production?
      return Song.limit(5000).order("RANDOM()")
    else
      return Song.all
    end
  end

end
