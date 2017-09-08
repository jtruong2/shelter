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
      if user == nil
        flash[:notice] = "You do not have an account."
        redirect_to root_path
      else
        session[:user_id] = user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
