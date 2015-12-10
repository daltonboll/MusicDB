# == Schema Information
#
# Table name: albums
#
#  id                   :integer          not null, primary key
#  title                :text
#  amountSold           :integer
#  billboard200Peak     :integer
#  numberOfSingles      :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  artist_id            :integer
#  genres               :string           default([]), is an Array
#  images               :string           default([]), is an Array
#  popularity           :integer          default(0)
#  spotifyID            :string
#  releaseDate          :string
#  albumType            :string
#  releaseDatePrecision :string
#  spotifyArtistID      :string
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
