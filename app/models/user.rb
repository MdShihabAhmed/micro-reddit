class User < ApplicationRecord 
  has_many :post
  has_many :comment

  validates :username, presence: true, length: { minimum: 4 }
end
