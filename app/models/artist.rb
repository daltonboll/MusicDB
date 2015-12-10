# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :text
#  age         :integer
#  homeCountry :text
#  homeRegion  :text
#  gender      :text
#  race        :text
#  debutYear   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  label_id    :integer
#  images      :string           default([]), is an Array
#  genres      :string           default([]), is an Array
#  popularity  :integer          default(0)
#  spotifyID   :string
#

class Artist < ActiveRecord::Base
  belongs_to :label # An Artist belongs to a Label
  has_many :songs # An Artist has many Songs
  has_many :albums # An Artist has many Albums
  has_many :awards # An Artist has many Awards
  validates :name, uniqueness: true
  validates_format_of :name, :with => /\A[A-Za-z0-9 ]*\z/ # must be in english

  def self.convert_quantone_data
    quantone_artists = QuantoneArtist.all

    quantone_artists.each do |q_artist|
      name = q_artist.stageName
      gender = q_artist.gender
      age = q_artist.age

      artist_hash = { name: name, gender: gender, age: age }
      artist = Artist.create(artist_hash)
      artist.save
    end
  end

  def self.prune_non_english_data
    artists = Artist.all
    letters = ('a'..'z').to_a + ('A'..'Z').to_a

    artists.each do |artist|
      name = artist.name
      contains_english = false

      while not contains_english
        letters.each do |letter|
          if name.include? letter
            contains_english = true
            break
          end
        end
      end

      if not contains_english
        puts "DESTROYING #{name}"
        artist.destroy
      end

    end

    return true
  end

  def self.convert_spotify_data
    spotify_artists = SpotifyArtist.all

    spotify_artists.each do |s_artist|
      s_name = s_artist.name
      artist = Artist.find_by(name: s_name)
      
      if not artist.nil?
        artist.spotifyID = s_artist.spotifyID
        artist.popularity = s_artist.popularity
        artist.genres = s_artist.genres
        artist.images = s_artist.images
        artist.save
      else
        puts "WE HAVE NO ARTIST WITH THE NAME #{s_name}"
      end
    end
  end

  def self.calculate_debut_years
    artists = Artist.all
    artists.each do |artist|
      albums = artist.albums
      large = 999999999
      earliest_album = large

      albums.each do |album|
        debut_year = album.calculate_year.to_i
        if debut_year != 0 and debut_year < earliest_album
          earliest_album = debut_year
        end
      end

      if earliest_album != large
        artist.debutYear = earliest_album
        artist.save
      end
    end
  end

  def get_truncated_name
    name = self.name

    if name.size > 32
      truncation = name[0,32] + "..."
      return truncation
    else
      return name
    end
  end

  def get_genres
    genres = self.genres
    genre_text = ""

    genres.each do |genre|
      genre_text += genre.titleize + ", "
    end

    len = genre_text.size
    genre_text = genre_text[0, len-2]
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

  def get_label
    label = self.label

    if label.nil?
      return "N/a"
    else
      return label.name
    end
  end

  def get_age
    age = self.age

    if age.nil?
      return "N/a"
    else
      return age
    end
  end

  def get_race
    race = self.race

    if race.nil?
      return "N/a"
    else
      return race
    end
  end

  def get_home_country
    home_country = self.homeCountry

    if home_country.nil?
      return "N/a"
    else
      return home_country
    end
  end

  def get_home_region
    home_region = self.homeRegion

    if home_region.nil?
      return "N/a"
    else
      return home_region
    end
  end

  def get_debut_year
    debut_year = self.debutYear

    if debut_year.nil?
      return "N/a"
    else
      return debut_year
    end
  end

end
