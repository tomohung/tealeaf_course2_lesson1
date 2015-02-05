class CommentsController < ApplicationController
  
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_param)
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      flash[:notice] = "Error for creating comment."
      render :index
    end
  end
  

  
end