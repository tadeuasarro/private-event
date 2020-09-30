module UsersHelper
  private

  def user_sign_in?
    session[:user_id].nil? ? false : true
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
