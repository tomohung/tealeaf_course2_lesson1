class VotesController < ApplicationController
  def create
    
    if params[:voteable_type] == 'Post'
      post = Post.find(params[:voteable_id])
      @vote = Vote.create(voteable: post, creator: current_user)
    else
      comment = Comment.find(params[:voteable_id])
      @vote = Vote.create(voteable: comment, creator: current_user)
    end

    if @vote.save
      redirect_to :back
    else
      flash[:error] = 'Fail to like.'
      redirect_to :back
    end
  end

  def destroy    
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to :back
  end
end