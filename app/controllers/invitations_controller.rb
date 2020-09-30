class InvitationsController < ApplicationController
  include UsersHelper
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new
    @invitation.invited_user_id = (User.find_by username: params[:invitation][:users][:username]).id
    @invitation.event_id = (Event.find_by name: params[:invitation][:events][:name]).id
    @event = Event.find_by name: params[:invitation][:events][:name]

    if current_user.id == @event.hoster_id
      if @invitation.save
        flash.notice = 'User invited successfully!'
        redirect_to root_path
      else
        flash.now[:alert] = 'User could not be invited, check the input information!'
        render :new
      end
    else
      flash.now[:alert] = "You can't make invitations for this event!"
      render :new
    end
  end
end
