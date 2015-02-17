class CommentsController < ApplicationController
  
  def create
    @post = Post.find_by slug: params[:post_id]
    @comment = @post.comments.build(comment_param)
    @comment.creator = current_user
    
    if @comment.save
      flash[:notice] = "Comment has been post."
      redirect_to post_path(params[:post_id])
    else      
      @post.comments.delete(@comment)
      render 'posts/show'
    end
  end
  
private 
  def comment_param
    params.require(:comment).permit(:body)
  end
  
end