# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :text
#  location   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Label < ActiveRecord::Base
  has_many :artists # Labels have many Artists

end
