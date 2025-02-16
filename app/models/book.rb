class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :featured_image
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, :author, presence: true

  def display_image
    featured_image.attached? ? featured_image : "default_book.png"
  end

  def average_rating
    ratings.average(:rating)&.round(1) || 0
  end
end
