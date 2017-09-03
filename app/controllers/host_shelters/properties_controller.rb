class HostShelters::PropertiesController < HostShelters::HostSheltersController

  def new
    @property = Property.new
  end

  def create
    property = current_user.properties.new(safe_params)
    if property.save
      session[:property_id] = property.id
      redirect_to host_shelters_path(property.id)
    else
      render file: 'public/404.html'
    end
  end

  def show
    
  end

 private

  def safe_params
   params.require(:property).permit(:street_address, :city, :state, :rooms_available)
  end
end
