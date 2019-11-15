class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, dependent: :destroy
  validates :body, presence: true, length: { maximum: 2000 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
