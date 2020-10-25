class Comment < ApplicationRecord
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :username, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
