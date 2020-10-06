class SessionsController < ApplicationController
  include UsersHelper

  before_action :require_logout, only: [:new]

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.find_by(session_params)

    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Logged in'
    else
      flash.now[:alert] = 'Invalid Username!'
      @user = User.new
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
