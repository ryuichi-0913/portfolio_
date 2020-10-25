class Users::NonfoodsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

 def new
    @user = current_user
    @nonfood = Nonfood.new
    @nonfood.tag_list.add("awesome", "slick")
    @nonfood.tag_list.remove("awesome", "slick")
  end

  def create
    @nonfood = Nonfood.new(nonfood_params)
    @nonfood.user = current_user

    if @nonfood.save
    redirect_to users_nonfood_path(@nonfood)
    else
    @user = current_user
    @nonfoods = Nonfood.all
    redirect_to users_nonfoods_path

    end
  end

  def index
    @nonfoods = Nonfood.page(params[:page]).reverse_order
    @user = current_user
    @nonfoodall_ranks = Nonfood.find(NonfoodFavorite.group(:nonfood_id).order('count(nonfood_id) desc').limit(3).pluck(:nonfood_id))

  end

  def show
    @nonfood = Nonfood.find(params[:id])
    @user = @nonfood.user
    @nonfood_comment = NonfoodComment.new
    @nonfood_comments = @nonfood.nonfood_comments

  end

  def edit
    @user = current_user
    @nonfood = Nonfood.find(params[:id])
    @nonfood.tag_list.add("awesome", "slick")
    @nonfood.tag_list.remove("awesome", "slick")
    if @nonfood.user != current_user
      redirect_to users_nonfoods_path
    end
  end

  def update
    @nonfood = Nonfood.find(params[:id])
   if @nonfood.update(nonfood_params)
    redirect_to users_nonfood_path(@nonfood.id)
   else
    render "edit"
   end
  end

  def destroy
    @nonfood = Nonfood.find(params[:id])
    @nonfood.destroy
    redirect_to users_nonfoods_path
  end


    private
  def nonfood_params
    params.require(:nonfood).permit(:nonfood_image, :nonfood_name, :nonfood_introduction, :tag_list)
  end
end

