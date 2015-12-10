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
  has_many :artists, dependent: :destroy # A Label has many Artists
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

  def self.assign_locations
    locations = ["California", "California", "California", "California", "California", "California", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "Georgia", "Tennessee", "New Jersey", "California", "California", "California", "California", "California", "California", "Florida", "Illinois", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "Texas", "Pennsylvania"]
    num_locations = locations.size - 1
    labels = Label.all

    labels.each do |label|
      location = locations[Random.rand(0..num_locations)]
      label.location = location
      label.save
    end
  end

  def self.assign_artists
    labels = Label.all
    num_labels = labels.size - 1
    artists = Artist.all

    artists.each do |artist|
      label = labels[Random.rand(0..num_labels)]
      label.artists << artist
      label.save
    end
  end

end
