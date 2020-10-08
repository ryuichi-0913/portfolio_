class Nonfood < ApplicationRecord
	belongs_to :user
	attachment :nonfood_image
end
