class HostShelters::PropertiesController < HostShelters::HostSheltersController
  before_action :auth_user_check?

  def new
    @property = Property.new
  end

  def create
  property = Property.create(safe_params)
   binding.pry
   if property.save
     session[:property_id] = property.id
     redirect_to root_path
   else
     render file: 404
   end
 end

 private

  def safe_params
   params.require(:property).permit(:street_address, :city, :state, :rooms_available)
  end
end
