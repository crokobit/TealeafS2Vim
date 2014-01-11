class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new( params.require(:category).permit(:name) )
    if @category.save
      flash[:notice] = 'Created new category'
      redirect_to posts_path
    else
      render :back
    end
  end

  def show
    @category = Category.find(params[:id])
  end

end
