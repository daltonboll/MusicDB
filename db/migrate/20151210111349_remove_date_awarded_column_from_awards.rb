class RemoveDateAwardedColumnFromAwards < ActiveRecord::Migration
  def change
    remove_column :awards, :dateAwarded
    add_column :awards, :yearAwarded, :integer
  end
end
