class AddArtistRefsToAward < ActiveRecord::Migration
  def change
    add_reference :awards, :artists, index: true
  end
end
