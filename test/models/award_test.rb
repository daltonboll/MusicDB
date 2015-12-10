# == Schema Information
#
# Table name: awards
#
#  id          :integer          not null, primary key
#  title       :text
#  event       :text
#  dateAwarded :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artist_id   :integer
#  album_id    :integer
#

require 'test_helper'

class AwardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
