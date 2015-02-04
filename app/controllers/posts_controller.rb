class PostsController < ApplicationController
  
before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    
  end

  def edit

  end

  def update
    if !@post.update(post_params)
      flash[:notice] = "Error for update"
      render :edit
    else
      redirect_to post_path(@post)
    end
  end

  def create
    @post = Post.new(post_params)
    if !@post.save
      flash[:notice] = "Error for creating new post."
      render :new
    else
      redirect_to post_path(@post)
    end
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

end
