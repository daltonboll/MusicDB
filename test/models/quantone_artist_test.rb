# == Schema Information
#
# Table name: quantone_artists
#
#  id          :integer          not null, primary key
#  quantoneID  :string
#  stageName   :string
#  artistType  :string
#  gender      :string
#  imageId     :string
#  spotifyId   :string
#  birthDate   :string
#  birthPlace  :string
#  deathDate   :string
#  deathPlace  :string
#  legalName   :string
#  age         :integer
#  homeCountry :string
#  homeRegion  :string
#  race        :string
#  debutYear   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class QuantoneArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
