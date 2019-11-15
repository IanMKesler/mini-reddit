class User < ApplicationRecord
    has_many :posts
    has_many :comments
    before_save { email.downcase! }
    validates :username, presence: true, uniqueness: true , length: { minimum: 4, maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }
end
