class AddPopularityColumnToAlbumsArtistsSongs < ActiveRecord::Migration
  def change
    add_column :artists, :popularity, :integer, default: 0
    add_column :albums, :popularity, :integer, default: 0
    add_column :songs, :popularity, :integer, default: 0
  end
end
