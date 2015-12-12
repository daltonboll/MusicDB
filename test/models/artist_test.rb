# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :text
#  age        :integer
#  homeRegion :text
#  gender     :text
#  race       :text
#  debutYear  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :integer
#  images     :string           default([]), is an Array
#  genres     :string           default([]), is an Array
#  popularity :integer          default(0)
#  spotifyID  :string
#

require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
