class Record < ApplicationRecord
  enum media: [:PL, :CD]
  has_many :record_genres
  has_many :genres, through: :record_genres
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }


  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  validates :artist, presence: true
  validates :album, presence: true
  validates :price, presence: true
end
