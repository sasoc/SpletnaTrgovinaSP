class CardItem < ApplicationRecord
  validates :user_id, uniqueness: { scope: :record_id }
end
