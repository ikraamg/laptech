class User < ApplicationRecord
  has_secure_password
  has_many :teches
  has_many :favourites, dependent: :destroy
  has_many :favourite_teches, through: :favourites, source: :tech

  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
