class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.text :title
      t.text :event
      t.date :dateAwarded

      t.timestamps null: false
    end
  end
end
