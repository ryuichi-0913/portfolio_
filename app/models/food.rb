class Food < ApplicationRecord
  belongs_to :user
  has_many :food_comments,dependent: :destroy
  has_many :food_comment_users, through: :food_comments, source: 'user'
  has_many :food_favorites, dependent: :destroy
  attachment :food_image

  validates :food_name, presence: true
  validates :food_introduction, presence: true, length: { maximum: 300 }
  acts_as_taggable

  def food_favorited_by?(user)
    food_favorites.where(user_id: user.id).exists?
  end
end
