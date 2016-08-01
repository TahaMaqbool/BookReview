class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]


  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("created_at Desc")
    end
  end

  def show
  end

  def new
    @b = current_user.books.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @b = current_user.books.build(b_params)
    #@b.category_id = params[:category_id]
    if @b.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @b.category_id = params[:category_id]
    if @b.update(b_params)
      redirect_to book_path(@b)
    else
      render 'edit'
    end
  end

  def destroy
    @b.destroy
    redirect_to root_path
  end


  private

  def find_book
    @b = Book.find(params[:id])
  end

  def b_params
    params.require(:book).permit(:title, :description, :author, :category_id, :book_img)
  end

end