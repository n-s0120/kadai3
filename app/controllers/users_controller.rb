class UsersController < ApplicationController

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:name).permit(:name, :email)
  end
end