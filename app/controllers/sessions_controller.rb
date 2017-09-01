class SessionsController < ApplicationController
  def new

  end

  def create
    byebug
    if user = User.from_omniauth(request.env["omniauth.auth"])
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
