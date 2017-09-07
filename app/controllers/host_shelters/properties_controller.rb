class HostShelters::PropertiesController < HostShelters::HostSheltersController

  def new
    @property = Property.new
  end

  def create
    property = current_user.properties.new(safe_params)
    if property.save
      current_user.owner! unless current_user.owner?
      session[:property_id] = property.id
      redirect_to host_shelters_path(property.id)
    else
      render file: 'public/404.html'
    end
  end

  def index
    @properties = current_user.properties
  end

  def show
    property_owner(property_id_params)
    @property = Property.find(property_id_params)
  end

 private

  def safe_params
   params.require(:property).permit( :street_address,
                                     :city,
                                     :state,
                                     :rooms_available)
  end

  def property_id_params
    params[:id]
  end
end
