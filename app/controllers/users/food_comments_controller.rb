class Users::FoodCommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @user = @food.user
    @foodnew = Food.new
    @food_comment = current_user.food_comments.new(food_comment_params)
    @food_comment.food_id = @food.id
    @food_comment.save
     render "index"
  end

  def destroy
  	FoodComment.find_by(id: params[:id], food_id: params[:food_id]).destroy
    redirect_to request.referer
  end

  private
  def food_comment_params
    params.require(:food_comment).permit(:food_comment)
  end

end




