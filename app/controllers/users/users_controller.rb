class Users::UsersController < ApplicationController

  def top
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
    	redirect_to users_user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    	redirect_to users_user_path(@user.id)
    else
    render action: :edit
   end
  end

  def follow
    @user = current_user
    @users = User.all
  end

  def followed
    @user = current_user
    @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:name, :user_image, :user_introduction, :profession, :gender, :age_group)
  end

end
