class Food < ApplicationRecord
  belongs_to :user
  has_many :food_comments,dependent: :destroy
  has_many :food_comment_users, through: :food_comments, source: 'user'
  attachment :food_image
end
