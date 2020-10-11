class Users::NonfoodFavoritesController < ApplicationController
  def create
  	@nonfood = Nonfood.find(params[:nonfood_id])
    nonfood_favorite = @nonfood.nonfood_favorites.new(user_id: current_user.id)
    nonfood_favorite.save
    redirect_to request.referer
  end

  def destroy
  	@nonfood = Nonfood.find(params[:nonfood_id])
    nonfood_favorite = current_user.nonfood_favorites.find_by(nonfood_id: @nonfood.id)
    nonfood_favorite.destroy
    redirect_to request.referer
  end
end
