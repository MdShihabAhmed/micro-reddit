class Post < ApplicationRecord
  has_many :comment
  belongs_to :user
end
