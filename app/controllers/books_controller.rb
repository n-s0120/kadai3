class BooksController < ApplicationController

  def new
    @books = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @books = Book.all
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
    else
    render :index
    end
  end

  def index
    @book = Book.new
    @user = @book.user
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
    else
    render :destroy
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
