class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def show
    
  end
  
  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to categories_path
    else
      flash[:notice] = "Error for creating new category."
      render :new
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path
  end
  
  def edit
    
  end
  
  def update
    if @category.update(category_param)
      redirect_to categories_path
    else
      flash[:notice] = "Error for updating category."
      render :edit
    end
  end
  
private
  def category_param
    params.require(:category).permit(:name)
  end
  
  def set_category
    @category = Category.find(params[:id])
  end
end