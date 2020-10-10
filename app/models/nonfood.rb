class Nonfood < ApplicationRecord
	belongs_to :user
	has_many :nonfood_comments,dependent: :destroy
    has_many :nonfood_comment_users, through: :nonfood_comments, source: 'user'
	attachment :nonfood_image
end
