class Book < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title,presence: true
  validates :price,presence: true
  validates :major,presence: true
  validates :price,presence: true
  validates :condition,presence: true
  validates :user_id,presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
