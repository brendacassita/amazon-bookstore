class Api::BooksController < ApplicationController

  # call on all methods in this class
  before_action :set_author, except:[:all_books]
  # call on show, :update, :destroy methods in this class
  before_action :set_book, only: [:show, :update, :destroy]

  def all_books
    render json: Book.all
  end

  def index
    render json: @author.books
  end

  def show
     render json: @book
  end

  def destroy
      render json: @book.destroy
  end

  def create
    book = @author.books.new(book_params)
      if(song.save)
        render json: book
      else
        render json: {errors: book.errors.full_messages}, status: 422
      end
  end

  def update
      if(@book.update(book_params))
          render json: @book
      else
          render json: {errors: @book.errors.full_messages}, status: 422
      end
  end

  private
  def set_author
    @author =  Author.find(params[:author_id])
  end

  def set_book
    @book = @author.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :genre)
  end
end