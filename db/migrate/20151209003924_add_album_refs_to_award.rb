class AddAlbumRefsToAward < ActiveRecord::Migration
  def change
    add_reference :awards, :album, index: true
  end
end
