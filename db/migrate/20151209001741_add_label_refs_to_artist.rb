class AddLabelRefsToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :label, index: true
  end
end
