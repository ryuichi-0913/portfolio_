class Users::UsersController < ApplicationController

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
    @foods = current_user.foods.all.reverse_order
    @nonfoods = current_user.nonfoods.all.reverse_order
    @instances = @foods | @nonfoods        # それぞれの複数インスタンスを合算して、一つの配列として出す
    @instances.sort!{ |a, b| b[:created_at] <=> a[:created_at] } # 作成降順に並び替え
    @instances = Kaminari.paginate_array(@instances).page(params[:page]) #paginate_arrayでカミナリに対応した記述変換
  end

  def favolist
    @user = current_user
    @foods = Food.all.reverse_order
    @nonfoods = Nonfood.all.reverse_order
    @instances = @foods | @nonfoods
    @instances.sort!{ |a, b| b[:created_at] <=> a[:created_at] }
    @instances = Kaminari.paginate_array(@instances).page(params[:page])
  end




  private

  def user_params
    params.require(:user).permit(:name, :user_image, :user_introduction, :profession, :gender, :age_group)
  end

end
