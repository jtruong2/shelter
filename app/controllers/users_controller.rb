class UsersController < ApplicationController
  def new
    @user = User.new
    auth = User.fb_token_call(params[:code])
    a = User.from_fb(auth)

    session[:user_id] = a.uid
    current_user
    redirect_to root_path
  end

  def create
    user = User.create(safe_params)
    if user.save
      session[:user_id] = user.id
      UserMailer.welcome_email(user).deliver_now
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
