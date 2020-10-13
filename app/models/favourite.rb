class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :tech
  validates_uniqueness_of :user_id, scope: :tech_id
end
