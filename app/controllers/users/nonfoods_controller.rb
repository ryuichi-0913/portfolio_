class Users::NonfoodsController < ApplicationController
 def new
    @nonfood = Nonfood.new
  end

  def create
    @nonfood = Nonfood.new(nonfood_params)
    @nonfood.user = current_user

    if @nonfood.save
    redirect_to users_nonfood_path(@nonfood)
    else
    @user = current_user
    @nonfoods = Nonfood.all
    render "index"
    end
  end

  def index
    @nonfoods = Nonfood.all
  end

  def show
    @nonfood = Nonfood.find(params[:id])
    @user = @nonfood.user
  end

  def edit
    @nonfood = Nonfood.find(params[:id])
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
    params.require(:nonfood).permit(:nonfood_image, :nonfood_name, :nonfood_introduction)
  end
end

