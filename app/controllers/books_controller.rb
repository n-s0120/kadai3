class BooksController < ApplicationController

  def new
    @books = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end

  def show
   @book= Book.new
   @book2 = Book.find(params[:id])
   @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.user_id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
