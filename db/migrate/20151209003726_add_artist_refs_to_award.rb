class AddArtistRefsToAward < ActiveRecord::Migration
  def change
    add_reference :awards, :artist, index: true
  end
end
