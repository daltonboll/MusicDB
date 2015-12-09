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
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
