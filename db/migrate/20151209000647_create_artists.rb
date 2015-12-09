class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :name
      t.integer :age
      t.text :homeCountry
      t.text :homeState
      t.text :gender
      t.text :race
      t.integer :debutYear

      t.timestamps null: false
    end
  end
end
