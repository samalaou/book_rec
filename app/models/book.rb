class Book < ApplicationRecord
    has_one_attached :featured_image
    has_many :comments, dependent: :destroy
    validates :title, :author, presence: true

    def display_image
        if featured_image.attached?
          featured_image
        else
          "default_book.png"
        end
      end
end
