class SessionsController < ApplicationController
  def new

  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
    elsif params
      user = User.find_by(email: params[:session]["email"])
      user && user.authenticate(params[:session]["password"])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
