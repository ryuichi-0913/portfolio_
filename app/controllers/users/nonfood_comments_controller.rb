class Users::NonfoodCommentsController < ApplicationController
	def create
    @nonfood = Nonfood.find(params[:nonfood_id])
    @user = @nonfood.user
    @nonfoodnew = Nonfood.new
    @nonfood_comment = current_user.nonfood_comments.new(nonfood_comment_params)
    @nonfood_comment.nonfood_id = @nonfood.id
    if @nonfood_comment.save
      redirect_to users_nonfood_path(@nonfood)
  else
     render "users/nonfoods/show"
  end
end

  def destroy
  	NonfoodComment.find_by(id: params[:id], nonfood_id: params[:nonfood_id]).destroy
    redirect_to request.referer
  end

  private
  def nonfood_comment_params
    params.require(:nonfood_comment).permit(:nonfood_comment)
  end
end
