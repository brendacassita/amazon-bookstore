class Api::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]
 
  def index
      render json: Author.all
  end

  def show
    # author = Author.find(params[:id])
     render json: @author
  end

  def create
    author = Author.new(author_params)
    if(author.save)
      render json: author
    else
      render json: {errors: author.errors.full_messages}, status: 422
    end   
  end

  def update
    if(@author.update(author_params))
      render json: @author
    else
      render json: {errors: @author.errors.full_messages}, status: 422
    end
  end

  def destroy
      render json: @author.destroy
  end


  # methods only visible to class
  private

  def author_params
    params.require(:author).permit(:name, :age)
  end

  def set_author
    puts 'set_author called!'
    @author = Author.find(params[:id])
  end
end



