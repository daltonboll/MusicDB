# == Schema Information
#
# Table name: spotify_artists
#
#  id         :integer          not null, primary key
#  name       :string
#  spotifyID  :string
#  images     :string           default([]), is an Array
#  popularity :integer
#  genres     :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SpotifyArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
