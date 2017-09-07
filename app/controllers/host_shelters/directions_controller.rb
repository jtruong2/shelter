class HostShelters::DirectionsController < ApplicationController

  def index
    property   = Property.find(params[:property_id])
    @direction = Direction.take_me_to(params[:my_local], property.address)
  end
end
