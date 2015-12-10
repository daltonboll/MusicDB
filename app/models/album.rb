# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  title            :text
#  releaseDate      :integer
#  genre            :text
#  amountSold       :integer
#  billboard200Peak :integer
#  numberOfSingles  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  artist_id        :integer
#

class Album < ActiveRecord::Base
  belongs_to :artist # An Album belongs to an Artist
  has_many :songs # An Album has many Songs
  has_many :awards # An Album has many Awards
end
