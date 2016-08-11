class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(c_params)
     #c = @category.name
    # @categories = Category.all
    if @category.save
      flash[:success] = "Category Created Successfully!"
      redirect_to new_book_path
    else
      render 'categories/new'
    end
  end

  private

  def c_params
    params.require(:category).permit(:name)
  end
end