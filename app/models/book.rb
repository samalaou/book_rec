class Book < ApplicationRecord
    has_one_attached :featured_image
    has_many :comments, dependent: :destroy
    validates :title, :author, presence: true
end
