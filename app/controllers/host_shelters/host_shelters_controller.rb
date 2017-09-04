class HostShelters::HostSheltersController < ApplicationController
  before_action :auth_user_check

  def auth_user_check
    unless current_user
       flash[:errors] = "Login Please"
       redirect_to login_path
     end
  end

  def property_owner(property_id)
    unless current_user != Property.find(property_id).user
      session[:user_id] = nil
      redirect_to login_path
    end
  end
end
