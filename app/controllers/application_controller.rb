class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :can_proceed
  helper_method :current_user, :logged_in?
  
  protected
  def can_proceed
    redirect_to welcome_login_path and return unless current_user
  end
  
  def current_user
    user_session = session[:user_id].nil? ? nil : User.find(session[:user_id])
    @current_user ||= user_session
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user=(user)
    @current_user = user
  end
end
