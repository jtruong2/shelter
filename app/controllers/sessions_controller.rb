class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end

    self.current_user = @auth.user
    redirect_to root_path
  end
#     user = oauth_info ? oauth_login(User.locate_by(oauth_info, true)) : manual_login(User.locate_by(params[:session][:email]))
#     if user == nil
#       flash[:notice] = "You do not have an account."
#       redirect_to root_path
#     else
#       session[:user_id] = user.id
#       redirect_to root_path
#     end
#
#     #
#     # if request.env["omniauth.auth"]
#     #   user = User.from_omniauth(request.env["omniauth.auth"])
#     #   session[:user_id] = user.id
#     #   redirect_to root_path
#     # elsif params
#     #   user = User.find_by(email: params[:session]["email"])
#     #   user && user.authenticate(params[:session]["password"])
#     # else
#     #   redirect_to root_path
#     # end
#   end
#
#   def destroy
#     session[:user_id] = nil
#     redirect_to root_path
#   end
#
#   private
#
#   def oauth_info
#     request.env["omniauth.auth"]
#   end
#
#   def oauth_login(user)
#     if user && user.new_record?
#       session[:omniauth_info] = oauth_info
#     else
#       session[:user_id] = user.id
#       session[:authenticated] = true
#     end
#   end
#
#   def manual_login(user)
#     if user && user.authenticate(params[:session][:password])
#       session[:user_id] = user.id
#       session[:authenticated] = true
#     else
#       flash.now[:danger] = incorrect_email_password
#       render :new
#     end
#   end

end
