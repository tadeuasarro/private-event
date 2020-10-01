class UsersController < ApplicationController
  include UsersHelper

  before_action :require_logout, only:[:new]

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

    @upcoming_events = Event.upcomming
    @past_events = Event.past
    @hosting_events = @user.hosting_events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
