class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :all_coordinates

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def omniauth_user
    @omniauth_info ||= session[:omniauth_info] if session[:omniauth_info]
  end

  def fb_user
    @omniauth_info ||= session[:omniauth_info] if session[:omniauth_info]
  end

  def all_coordinates
    Property.all_coordinates
  end

  def all_properties
    Property.all
  end
end
