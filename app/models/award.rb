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
#

class Award < ActiveRecord::Base
end
