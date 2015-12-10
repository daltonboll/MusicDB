# == Schema Information
#
# Table name: spotify_songs
#
#  id              :integer          not null, primary key
#  spotifyID       :string
#  spotifyAlbumID  :string
#  spotifyArtistID :string
#  discNumber      :integer
#  durationMS      :integer
#  explicit        :boolean
#  title           :string
#  popularity      :integer
#  trackNumber     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SpotifySong < ActiveRecord::Base
end
