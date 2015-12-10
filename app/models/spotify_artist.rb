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

class SpotifyArtist < ActiveRecord::Base
end
