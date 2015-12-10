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

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
