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
#

class Song < ActiveRecord::Base
  belongs_to :artist # A Song belongs to an Artist
  belongs_to :album # A slong belongs to an Album
end
