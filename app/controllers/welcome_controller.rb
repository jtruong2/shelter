class WelcomeController < ApplicationController
  def index
    @properties = Property.all
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
  end
end
