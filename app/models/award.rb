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

class Award < ActiveRecord::Base
  belongs_to :artist # An Award belongs to an Artist
  belongs_to :album # An Award belongs to an Album
end
