class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :username, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
end
