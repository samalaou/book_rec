class Book < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, :author, presence: true
end
