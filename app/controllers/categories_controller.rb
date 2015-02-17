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
      flash[:notice] = "New Category has been created."
      redirect_to categories_path
    else      
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
      flash[:notice] = "Category has been updated."
      redirect_to categories_path
    else      
      render :edit
    end
  end
  
private
  def category_param
    params.require(:category).permit(:name)
  end
  
  def set_category
    @category = Category.find_by slug: params[:id]
  end
end