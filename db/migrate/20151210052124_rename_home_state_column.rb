class RenameHomeStateColumn < ActiveRecord::Migration
  def change
    rename_column :artists, :homeState, :homeRegion
  end
end
