class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :login_user!

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    new_session_token = user.reset_session_token!
    session[:session_token] = new_session_token
    redirect_to cats_url
  end

end
