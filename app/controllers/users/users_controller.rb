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
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
    @users = User.all
  end

  def userallpost
    @user = current_user
    @foods = current_user.foods.all
    @nonfoods = current_user.nonfoods.all
    # それぞれの複数インスタンスを1つの配列にする
    @instances = @foods | @nonfoods
    # 作成降順に並び替え
    @instances.sort!{ |a, b| b[:created_at] <=> a[:created_at] }
  end

  def favolist
    @user = current_user
    @foods = Food.all
    @nonfoods = Nonfood.all
    @instances = @foods | @nonfoods
    @instances.sort!{ |a, b| b[:created_at] <=> a[:created_at] }
  end




  private

  def user_params
    params.require(:user).permit(:name, :user_image, :user_introduction, :profession, :gender, :age_group)
  end

end
