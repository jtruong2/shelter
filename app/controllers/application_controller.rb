class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :all_coordinates
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id] != nil
  end

  def all_coordinates
    Property.all_coordinates
  end

  def all_properties
    Property.all
  end
end
