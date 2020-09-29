class EventsController < ApplicationController
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
    @event = current_user.events.build(event_params)
    @event.save

    flash.notice = "Event #{@event.name} created!"
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end

end
