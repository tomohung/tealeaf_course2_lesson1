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
      respond_to do |format|
        format.html do
          redirect_to :back
        end
        format.js
      end
    else
      flash[:error] = 'Fail to like.'
      flash.now
    end
  end

  def destroy    
    @vote = Vote.find(params[:id])
    @vote.destroy
    respond_to do |format|
      format.html do
        redirect_to :back
      end
      format.js
    end
  end
end