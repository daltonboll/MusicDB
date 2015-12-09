class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :title
      t.integer :releaseDate
      t.text :genre
      t.integer :amountSold
      t.integer :billboard200Peak
      t.integer :numberOfSingles

      t.timestamps null: false
    end
  end
end
