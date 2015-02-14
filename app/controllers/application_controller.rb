class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :created_by?
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    if session[:user_id] && !User.exists?(session[:user_id])
      session[:user_id] = nil
    end
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def created_by?(post)
    post.creator == current_user
  end
 
end
