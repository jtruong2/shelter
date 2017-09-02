class HostShelters::PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
  property = Property.create(safe_params)
   if property.save
     session[:property_id] = property.id
     redirect_to root_path
   else
     redirect_to new_user_path
   end
 end

 private

  def safe_params
   params.require(:property).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
