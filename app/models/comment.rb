class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user, optional: true
  validates :content, presence: true
end
