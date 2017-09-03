class AlertsController < ApplicationController
  def index
    @alerts = Alert.find_all
  end
end
