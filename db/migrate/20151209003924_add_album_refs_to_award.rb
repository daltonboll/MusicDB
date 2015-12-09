class AddAlbumRefsToAward < ActiveRecord::Migration
  def change
    add_reference :awards, :albums, index: true
  end
end
