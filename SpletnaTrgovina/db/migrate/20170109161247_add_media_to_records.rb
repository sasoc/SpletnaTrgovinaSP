class AddMediaToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :media, :integer
    add_column :users, :role, :integer
  end
end
