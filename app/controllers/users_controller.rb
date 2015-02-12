class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit!)

    if @user.save
      flash[:notice] = "User Registed! Please Log In."
      redirect_to posts_path
    else
      render :new
    end
  end
end