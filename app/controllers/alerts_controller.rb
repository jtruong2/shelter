class AlertsController < ApplicationController
  def index
    state = params[:state]
    state ? @alerts = Alert.find_by(state) : @alerts = Alert.find_all
  end
end
