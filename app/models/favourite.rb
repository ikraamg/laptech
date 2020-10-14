class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :tech
  validates :user_id, presence: true
  validates :tech_id, presence: true
  validates_uniqueness_of :user_id, scope: :tech_id
end
