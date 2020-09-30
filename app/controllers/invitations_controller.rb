class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)

     if @invitation.save
      flash.notice = "User invited successfully!"
      redirect_to root_path
     else
      flash.now[:alert] = "User could not be invited!"
      render :new
     end
  end

  def invitation_params
    params.require(:invitation).permit(:invited_user_id, :event_id)
  end
end
