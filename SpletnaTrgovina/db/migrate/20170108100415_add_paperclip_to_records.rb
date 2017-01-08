class AddPaperclipToRecords < ActiveRecord::Migration[5.0]
  def change
    add_attachment :records, :image
  end
end
