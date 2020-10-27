class FoodComment < ApplicationRecord
	belongs_to :user
	belongs_to :food
	validates :food_comment, presence: true
end
