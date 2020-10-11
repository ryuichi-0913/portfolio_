class NonfoodFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :nonfood
end
