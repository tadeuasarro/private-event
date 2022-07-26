module EventsHelper
  def upcoming_events_check(event)
    'Upcoming events' unless event.empty?
  end

  def past_events_check(event)
    'Previous events' unless event.empty?
  end
end
