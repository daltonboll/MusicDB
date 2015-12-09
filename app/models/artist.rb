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
#  labels_id   :integer
#

class Artist < ActiveRecord::Base
  belongs_to :label # An Artist belongs to a Label
  has_many :songs # An Artist has many Songs
  has_many :albums # An Artist has many Albums
  has_many :awards # An Artist has many Awards
end
