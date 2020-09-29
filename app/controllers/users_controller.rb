class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    flash.notice = "User #{@user.username} created!"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_in
    session[:login_session] = {username: @user.username}
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
