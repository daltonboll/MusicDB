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
  has_many :artists # A Label has many Artists
  validates :name, uniqueness: true

  def self.populate_database
    label_names = []
    File.open("lib/labels.txt", "r") do |f|
      f.each_line do |label|
        label_names.append(label.squish)
      end
    end

    label_names.each do |name|
      label_hash = { name: name }
      label = Label.create(label_hash)
      label.save
    end
  end

end
