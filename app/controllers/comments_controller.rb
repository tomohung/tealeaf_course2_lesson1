class CommentsController < ApplicationController
    
  def create
    @comment = Comment.new(comment_param)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment send."
      redirect_to post_path(params[:post_id])
    else      
      @post = @comment.post
      render 'posts/show'
    end
  end
  
private 
  def comment_param
    params.require(:comment).permit(:body)
  end
  
end