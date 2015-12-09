class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title
      t.integer :billboardHot100Peak
      t.integer :radioPlayPeak
      t.integer :spotifyStreams
      t.boolean :hasMusicVideo
      t.boolean :isSingle
      t.integer :amountSold

      t.timestamps null: false
    end
  end
end
