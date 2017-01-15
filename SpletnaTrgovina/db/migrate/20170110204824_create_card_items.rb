class CreateCardItems < ActiveRecord::Migration[5.0]
  def change
    create_table :card_items do |t|
      t.belongs_to :record, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
