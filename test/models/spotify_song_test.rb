# == Schema Information
#
# Table name: spotify_songs
#
#  id              :integer          not null, primary key
#  spotifyID       :string
#  spotifyAlbumID  :string
#  spotifyArtistID :string
#  discNumber      :integer
#  durationMS      :integer
#  explicit        :boolean
#  title           :string
#  popularity      :integer
#  trackNumber     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class SpotifySongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
