class Users::FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
    redirect_to users_food_path(@food)
    else
    @user = current_user
    @foods = Book.all
    render "index"
    end
  end

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @user = @food.user
  end

  def edit
    @food = Food.find(params[:id])
    if @food.user != current_user
      redirect_to users_foods_path
    end
  end

  def update
    @food = Food.find(params[:id])
   if @food.update(food_params)
    redirect_to users_food_path(@food.id)
   else
    render "edit"
   end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to users_foods_path
  end


    private
  def food_params
    params.require(:food).permit(:food_image, :food_name, :food_introduction)
  end
end
