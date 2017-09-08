class HostShelters::ReservationsController < HostShelters::HostSheltersController

  def index
    @property = Property.find(params[:property_id])
  end

end
