# == Schema Information
#
# Table name: awards
#
#  id          :integer          not null, primary key
#  title       :text
#  event       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artist_id   :integer
#  album_id    :integer
#  yearAwarded :integer
#

class Award < ActiveRecord::Base
  belongs_to :artist # An Award belongs to an Artist
  belongs_to :album # An Award belongs to an Album

  def self.populate_database
    beginning_year = 1975
    ending_year = 2014
    award_events = []
    award_titles = []

    File.open("lib/award_events.txt", "r") do |f|
      f.each_line do |event|
        award_events.append(event.squish)
      end
    end

    File.open("lib/award_titles.txt", "r") do |f|
      f.each_line do |title|
        award_titles.append(title.squish)
      end
    end

    (beginning_year..ending_year).each do |year|
      award_events.each do |event|
        award_titles.each do |title|
          award_hash = { title: title, event: event, yearAwarded: year }
          award = Award.create(award_hash)
          award.save
        end
      end
    end
  end

  def self.assign_awards
    artists = Artist.all
    award_numbers = [0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    award_numbers_len = award_numbers.size - 1

    artists.each do |artist|
      num_artist_awards = award_numbers[Random.rand(0..award_numbers_len)]
      earliest_award = artist.debutYear
      awards = Award.where('"yearAwarded" >= ?', earliest_award)

      if awards.nil? or awards.size == 0
        next
      end

      num_awards = awards.size - 1

      (0..num_artist_awards).each do |i|
        award = awards[Random.rand(0..num_awards)]
        if award.artist.nil?
          artist.awards << award
          artist.save
        end
      end
    end
  end

  def self.delete_awards_with_no_artist
    awards = Award.all

    awards.each do |award|
      artist = award.artist
      if artist.nil?
        award.destroy
      end
    end
  end

  def get_artist
    artist = self.artist

    if artist.nil?
      return "N/a"
    else
      return artist.name
    end
  end

  def get_artist_id
    artist = self.artist
    if not artist.nil?
      return artist.id
    else
      return -1
    end
  end

end
