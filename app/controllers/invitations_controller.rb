class InvitationsController < ApplicationController
  include UsersHelper

  before_action :require_login

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new

    invitation_params

    if @invitation.save
      flash.notice = 'User invited successfully!'
      redirect_to events_path
    else
      flash.now[:alert] = 'Invitation could not be created, check the input information!'
      render :new
    end
  end

  private

  def invitation_params
    unless invitation_invited_user_check || invitation_event_check
      @invitation.invited_user_id = (User.find_by username: params[:invitation][:users][:username]).id
      @invitation.event_id = (Event.find_by name: params[:invitation][:events][:name]).id
      @event = Event.find_by name: params[:invitation][:events][:name]
    end
    @event
  end

  def invitation_invited_user_check
    (User.find_by username: params[:invitation][:users][:username]).nil?
  end

  def invitation_event_check
    (Event.find_by name: params[:invitation][:events][:name]).nil?
  end
end
