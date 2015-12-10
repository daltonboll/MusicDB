# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  title            :text
#  releaseDate      :integer
#  amountSold       :integer
#  billboard200Peak :integer
#  numberOfSingles  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  artist_id        :integer
#  genres           :string           default([]), is an Array
#  images           :string           default([]), is an Array
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
