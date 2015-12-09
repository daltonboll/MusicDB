class AddAlbumRefsToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :albums, index: true
  end
end
