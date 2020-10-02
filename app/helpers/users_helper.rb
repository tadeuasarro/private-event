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
end
