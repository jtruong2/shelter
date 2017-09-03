class HostShelters::HostSheltersController < ApplicationController
  before_action :auth_user_check

  def auth_user_check
    unless current_user
       flash[:errors] = "Login Please"
       render file: 'public/404.html'
     end
  end
end
