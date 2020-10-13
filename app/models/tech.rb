class Tech < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :user_id
  has_many :favourites
  has_many :users_favourited, through: :favourites, source: :user, dependent: :destroy
  has_many_attached :images
end
