class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created."
      redirect_to post_path(@post)
    else
      render :new
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
