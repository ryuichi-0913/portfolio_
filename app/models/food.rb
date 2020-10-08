class Food < ApplicationRecord
  belongs_to :user
  attachment :food_image
end
