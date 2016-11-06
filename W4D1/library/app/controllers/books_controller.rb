class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    t = Book.create(book_params)
    redirect_to :action => "index"
  end

  def destroy
    Book.find_by_id(params[:id]).destroy
    redirect_to :action => "index"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
