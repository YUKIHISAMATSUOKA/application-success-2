class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit]

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end


  def create
    @books = Book.all #このコードを付け足さないとエラーがでる　なぜ？？？
    @book = Book.new(book_params)
    @book.user_id = current_user.id #UserとBookは1対Nの関係にあるので、誰が投稿するのかを宣言している
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      render action: :index
    end

  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to book_path(@book)
    end
  end
end
