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
    @book = Book.new
    @books = @user.books
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "successfully"
    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end