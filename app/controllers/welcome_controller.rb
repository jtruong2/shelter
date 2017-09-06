class WelcomeController < ApplicationController
  def index
    @properties = Property.all
    @all_coordinates = Property.all_coordinates
  end
end
