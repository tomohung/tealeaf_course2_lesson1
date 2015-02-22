class VotesController < ApplicationController
  def create
    
    class_type = params[:voteable_type].constantize
    object = class_type.find(params[:voteable_id])
    @vote = Vote.create(voteable: object, creator: current_user)

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