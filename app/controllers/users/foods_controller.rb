class Users::FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy new create]

  def new
    @user = current_user
    @food_new = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to users_food_path(@food)
    else
      @user = current_user
      @food_new = Food.new
      render 'new'
    end
  end

  def index
    @foods = Food.page(params[:page]).reverse_order
    @user = current_user
    @foodall_ranks = Food.find(FoodFavorite.group(:food_id).order('count(food_id) desc').limit(3).pluck(:food_id))
  end

  def show
    @food = Food.find(params[:id])
    @user = @food.user
    @food_comment = FoodComment.new
    @food_comments = @food.food_comments
  end

  def edit
    @user = current_user
    @food = Food.find(params[:id])
    redirect_to users_foods_path if @food.user != current_user
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to users_food_path(@food.id)
    else
      render 'edit'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to users_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:food_image, :food_name, :food_introduction, :tag_list)
  end
end
