class WelcomeController < ApplicationController
  def index
    @properties = all_properties
  end
end
