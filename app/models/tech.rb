class Tech < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :user_id
  has_many :favourites
  has_many_attached :images
  has_many :users_favourited, through: :favourites, source: :user, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :cost, presence: true
end
