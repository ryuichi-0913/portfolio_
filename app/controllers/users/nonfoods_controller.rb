class Users::NonfoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy new create]

  def new
    @user = current_user
    @nonfood_new = Nonfood.new
  end

  def create
    @nonfood = Nonfood.new(nonfood_params)
    @nonfood.user = current_user
    if @nonfood.save
      redirect_to users_nonfood_path(@nonfood)
    else
      @user = current_user
      @nonfood_new = Nonfood.new
      render 'new'
    end
  end

  def index
    @nonfoods = Nonfood.page(params[:page]).reverse_order
    @user = current_user
    @nonfoodall_ranks = Nonfood.find(NonfoodFavorite.group(:nonfood_id).order('count(nonfood_id) desc').limit(3).pluck(:nonfood_id))  # rubocop:disable Layout/LineLength
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
    redirect_to users_nonfoods_path if @nonfood.user != current_user
  end

  def update
    @nonfood = Nonfood.find(params[:id])
    if @nonfood.update(nonfood_params)
      redirect_to users_nonfood_path(@nonfood.id)
    else
      render 'edit'
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
