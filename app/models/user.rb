class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
end
