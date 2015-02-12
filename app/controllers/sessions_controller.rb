class SessionsController < ApplicationController
  
  def new 
    @user = User.new
  end
  
  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      flash[:notice] = 'Login Success.'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Username or Password may not correct. Try again."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Log out'
    redirect_to root_path
  end
  
end