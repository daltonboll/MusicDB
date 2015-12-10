# == Schema Information
#
# Table name: quantone_artists
#
#  id          :integer          not null, primary key
#  quantoneID  :string
#  stageName   :string
#  artistType  :string
#  gender      :string
#  imageID     :string
#  spotifyID   :string
#  birthYear   :integer
#  birthPlace  :string
#  deathYear   :integer
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

class QuantoneArtist < ActiveRecord::Base
  validates :stageName, :quantoneID, uniqueness: true
end
