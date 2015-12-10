# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :text
#  age         :integer
#  homeCountry :text
#  homeState   :text
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

end
