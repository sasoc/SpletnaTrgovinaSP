class CreateRecordGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :record_genres do |t|
      t.belongs_to :genres, index: true
      t.belongs_to :records, index: true
      t.timestamps
    end
  end
end
