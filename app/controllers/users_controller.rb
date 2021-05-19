class UsersController < ApplicationController

  def new
    @users = User.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @book = Book.find(params[:id])
    redirect_to book_path(@book.user_id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end