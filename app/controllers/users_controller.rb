class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def show
   @user=User.find(params[:id])
   @books=@user.books
   @book=Book.new
  end

  def edit
  end

  def index
    @user=current_user
    @book=Book.new
  end
  
  def update
      
  end
  
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
