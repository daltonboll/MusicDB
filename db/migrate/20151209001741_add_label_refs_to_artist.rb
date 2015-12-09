class AddLabelRefsToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :labels, index: true
  end
end
