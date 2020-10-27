class Users::NonfoodFavoritesController < ApplicationController
  before_action :nonfood_params

  def create
    nonfood_favorite = @nonfood.nonfood_favorites.new(user_id: current_user.id)
    nonfood_favorite.save
  end

  def destroy
    nonfood_favorite = current_user.nonfood_favorites.find_by(nonfood_id: @nonfood.id)
    nonfood_favorite.destroy
  end

    private
  def nonfood_params
    @nonfood = Nonfood.find(params[:nonfood_id])
  end
end
