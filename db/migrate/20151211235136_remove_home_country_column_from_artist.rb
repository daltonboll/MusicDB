class RemoveHomeCountryColumnFromArtist < ActiveRecord::Migration
  def change
    remove_column :artists, :homeCountry
  end
end
