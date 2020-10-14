class User < ApplicationRecord
  has_secure_password
  has_many :teches
  has_many :favourites
  has_many :favourite_teches, through: :favourites, source: :tech, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
