class AddAlbumRefsToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :album, index: true
  end
end
