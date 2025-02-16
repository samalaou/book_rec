class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :comments
  has_many :ratings, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
