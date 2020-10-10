class NonfoodComment < ApplicationRecord
	belongs_to :user
	belongs_to :nonfood
	validates :nonfood_comment, presence: true
end
