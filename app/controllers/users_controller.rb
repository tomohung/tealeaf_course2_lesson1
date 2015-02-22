class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_param)

    if @user.save
      flash[:notice] = "User Registed!"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def show
    
  end

  def edit

  end

  def update

    if @user.update(set_param)
      flash[:notice] = "User Profile Updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find_by slug: params[:id]
  end

  def set_param
    params.require(:user).permit(:username, :password, :password_confirmation, :time_zone)
  end

end