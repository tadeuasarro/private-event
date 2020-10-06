module UsersHelper
  private

  def user_sign_in?
    session[:user_id].nil? ? false : true
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    return if user_sign_in?

    flash.notice = 'You have to be logged in to access that page'
    redirect_to root_path
  end

  def require_logout
    redirect_to events_path if user_sign_in?
  end

  def hosting_event_check(event)
    'Events hosted by this user: ' unless event.empty?
  end

  def past_event_user_check(event)
    'Events this user attended to: ' unless event.empty?
  end

  def upcoming_event_user_check(event)
    'This user is coming to these events: ' unless event.empty?
  end
end
