class Event < ApplicationRecord
  belongs_to :user
  default_scope -> {order(dead: :asc)}
  validates :content, presence: true
  validates :dead, presence: true
  validates :user_id, presence: true
end
