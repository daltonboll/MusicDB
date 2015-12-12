# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :text
#  age        :integer
#  homeRegion :text
#  gender     :text
#  race       :text
#  debutYear  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :integer
#  images     :string           default([]), is an Array
#  genres     :string           default([]), is an Array
#  popularity :integer          default(0)
#  spotifyID  :string
#

class Artist < ActiveRecord::Base
  belongs_to :label # An Artist belongs to a Label
  has_many :songs, dependent: :destroy # An Artist has many Songs
  has_many :albums, dependent: :destroy # An Artist has many Albums
  has_many :awards, dependent: :destroy # An Artist has many Awards
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

  def self.delete_artists_with_no_albums
    artists = Artist.all

    artists.each do |artist|
      if artist.albums.empty?
        artist.destroy
      end
    end
  end

  def self.delete_artists_randomly
    artists = Artist.all
    deletion_factors = [1, 1, 0, 1, 0, 1, 1, 0, 1, 0]
    factor_length = deletion_factors.size - 1

    artists.each do |artist|
      factor = deletion_factors[Random.rand(0..factor_length)]
      if factor == 1
        artist.destroy
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

  def get_label
    label = self.label

    if label.nil?
      return "N/a"
    else
      return label.name
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

  def get_gender
    gender = self.gender

    if gender.nil?
      return "N/a"
    else
      return gender
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
    base = "https://play.spotify.com/artist/"
    spotify_id = self.spotifyID

    if spotify_id.nil?
      return "#"
    else
      return base + self.spotifyID
    end
  end

  def self.get_select_field_list
    artists = Artist.order(:name)
    list_of_options = []

    artists.each do |artist|
      name = artist.name
      id = artist.id
      list_of_options.append([name, id])
    end

    return list_of_options
  end

  def get_label_id
    label = self.label
    if not label.nil?
      return label.id
    else
      return -1
    end
  end

  def self.generate_home_regions
    list_of_regions = ["United States", "France", "Canada", "Australia", "Germany", "Austria", "Chile", "Argentina", "England", "Russia", "Egypt", "South Africa"]
    num_regions = list_of_regions.size - 1
    artists = Artist.all

    artists.each do |artist|
      region = list_of_regions[Random.rand(0..num_regions)]
      artist.homeRegion = region
      artist.save
    end
  end

  def self.generate_races
    list_of_races = ["Indian American", "White", "African American", "Asian", "Pacific Islander"]
    num_races = list_of_races.size - 1
    artists = Artist.all

    artists.each do |artist|
      race = list_of_races[Random.rand(0..num_races)]
      artist.race = race
      artist.save
    end
  end


end
