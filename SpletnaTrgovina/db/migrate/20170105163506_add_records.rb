class AddRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :album
      t.string :artist
      t.text :description
      t.decimal :price
      t.timestamps
    end
  end
end
