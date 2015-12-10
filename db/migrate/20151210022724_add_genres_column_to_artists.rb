class AddGenresColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :genres, :string, array: true, default: []
  end
end
