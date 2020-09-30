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

    @upcoming_events = []
    @previous_events =  []

    @user.invited_events.each do |event|
      if event.date >= Date.today
        @upcoming_events.push(event)
      else
        @previous_events.push(event)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
