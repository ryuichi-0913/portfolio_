class Users::NonfoodCommentsController < ApplicationController
	def create
    @nonfood = Nonfood.find(params[:nonfood_id])
    @nonfoodnew = Nonfood.new
    @nonfood_comment = current_user.nonfood_comments.new(nonfood_comment_params)
    @nonfood_comment.nonfood_id = @nonfood.id
    @nonfood_comment.save
  end

  def destroy
  	NonfoodComment.find_by(id: params[:id], nonfood_id: params[:nonfood_id]).destroy
    @nonfood = Nonfood.find(params[:nonfood_id])
    @nonfood_comments = @nonfood.nonfood_comments
  end

  private
  def nonfood_comment_params
    params.require(:nonfood_comment).permit(:nonfood_comment)
  end
end
