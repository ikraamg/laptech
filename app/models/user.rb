class User < ApplicationRecord
  has_secure_password
  has_many :teches
  has_many :favourites
  has_many :favourite_teches, through: :favourites, source: :tech, dependent: :destroy
end
