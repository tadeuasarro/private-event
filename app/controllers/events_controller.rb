class EventsController < ApplicationController
  include UsersHelper

  before_action :require_login

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.hoster_id = current_user.id

    if @event.save
      flash.notice = "Event #{@event.name} created!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid post'
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
