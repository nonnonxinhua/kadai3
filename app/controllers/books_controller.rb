class BooksController < ApplicationController
  def index
    @user=current_user
    @books=Book.all
    @book=Book.new
  end

  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if@book.save
    redirect_to book_path(@book.id)
   else
     render :new
   end
  end

  def show
   @book = Book.find(params[:id])
   @user=current_user
   @book_new=Book.new
  end

  def edit

  end


private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
