class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(safe_params)
    if user.save
      session[:user_id] = user.id
      authy = Authy::API.register_user
      (
        email: user.email,
        cellphone: user.phone_number
        country_code: 1
      )
      user.update(authy_id: authy.id)
      Authy::API.request_sms(id: user.auth_id)
      redirect_to verify_path
      #redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
