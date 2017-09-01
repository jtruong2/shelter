class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(safe_params)
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
