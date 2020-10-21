class Users::FoodFavoritesController < ApplicationController
  before_action :food_params
  def create
    food_favorite = @food.food_favorites.new(user_id: current_user.id)
    food_favorite.save
  end

  def destroy
    food_favorite = current_user.food_favorites.find_by(food_id: @food.id)
    food_favorite.destroy
  end

    private

  def food_params
    @food = Food.find(params[:food_id])
  end

end
