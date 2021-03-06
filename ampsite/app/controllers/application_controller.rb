class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authorize
  helper_method :authorize!
  helper_method :authorize_options
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/' unless current_user
  end

  def authorize!
    redirect_to '/' unless current_user && current_user.admin?
  end

  def authorize_options
    return true if current_user && current_user.admin?
  end


end
