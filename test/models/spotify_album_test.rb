# == Schema Information
#
# Table name: spotify_albums
#
#  id                   :integer          not null, primary key
#  spotifyID            :string
#  albumType            :string
#  spotifyArtistID      :string
#  genres               :string           default([]), is an Array
#  images               :string           default([]), is an Array
#  title                :string
#  popularity           :integer
#  releaseDate          :string
#  releaseDatePrecision :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class SpotifyAlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
