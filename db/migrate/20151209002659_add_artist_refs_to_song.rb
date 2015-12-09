class AddArtistRefsToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :artists, index: true
  end
end
