class AddArtistRefsToAlbum < ActiveRecord::Migration
  def change
    add_reference :albums, :artists, index: true
  end
end
