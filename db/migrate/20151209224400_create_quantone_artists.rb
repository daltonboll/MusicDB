class CreateQuantoneArtists < ActiveRecord::Migration
  def change
    create_table :quantone_artists do |t|
      t.string :quantoneID
      t.string :stageName
      t.string :artistType
      t.string :gender
      t.string :imageID
      t.string :spotifyID
      t.integer :birthYear
      t.string :birthPlace
      t.integer :deathYear
      t.string :deathPlace
      t.string :legalName
      t.integer :age
      t.string :homeCountry
      t.string :homeRegion
      t.string :race
      t.integer :debutYear

      t.timestamps null: false
    end
  end
end
