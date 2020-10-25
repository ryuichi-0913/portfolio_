class Nonfood < ApplicationRecord
	belongs_to :user
	has_many :nonfood_comments,dependent: :destroy
    has_many :nonfood_comment_users, through: :nonfood_comments, source: 'user'
    has_many :nonfood_favorites, dependent: :destroy
	attachment :nonfood_image

    validates :nonfood_name, presence: true
    validates :nonfood_introduction, presence: true, length: { maximum: 300 }

	acts_as_taggable

  def nonfood_favorited_by?(user)
    nonfood_favorites.where(user_id: user.id).exists?
  end
end
