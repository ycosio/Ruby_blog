class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
   @users = User.new(user_params)

   if @users.save
     redirect_to @users
   else
     render 'new'
   end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    @users.update(user_params)
    redirect_to @users
  end

  def show
    @users = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :pass)
    end
end
