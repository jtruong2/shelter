class SessionsController < ApplicationController
  def new

  end

  def create
    if request.env["omniauth.auth"]
      if user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      user = User.find_by(email: params[:session]["email"])
      if user && user.authenticate(params[:session]["password"])
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
