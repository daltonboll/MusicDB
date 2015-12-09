class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.text :name
      t.text :location

      t.timestamps null: false
    end
  end
end
