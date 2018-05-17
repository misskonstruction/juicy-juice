class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  default_scope -> {order(updated_at: :desc)}
end