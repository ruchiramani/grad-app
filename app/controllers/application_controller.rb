class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user 
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def log_in(user)
    session[:id] = user.id
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to rooth_path unless logged_in?
  end
end
