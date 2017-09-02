class HostShelters::HostSheltersController < ApplicationController
  helper_method :auth_user_check?

  def auth_user_check?
    unless current_user
       flash[:errors] = "Login Please"
       return false
     end
  end
end
