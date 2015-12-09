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
#

class Artist < ActiveRecord::Base
  belongs_to :label # Artists belong to a Label

end
