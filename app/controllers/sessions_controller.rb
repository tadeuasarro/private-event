class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(session_params)
    
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Loged in"
    else
      flash.now[:alert] = "Invalid Username"
      @user = User.new
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "log out"
  end

  private 

  def session_params
    params.require(:user).permit(:username)
  end
end
