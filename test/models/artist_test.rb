# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :text
#  age         :integer
#  homeCountry :text
#  homeState   :text
#  gender      :text
#  race        :text
#  debutYear   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  label_id    :integer
#

require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
