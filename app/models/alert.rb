class Alert
  attr_reader :event, :headline, :description,
              :instructions, :severity, :urgency

  def initialize(alert_info)
    @event        = alert_info[:event]
    @headline     = alert_info[:headline]
    @description  = alert_info[:description]
    @instructions = alert_info[:instruction]
    @severity     = alert_info[:severity]
    @urgency      = alert_info[:urgency]
  end

  def self.find_all
    api_alerts = WeatherAlertService.find_national_alerts
    api_alerts.map do |api_alert|
      new(api_alert[:properties])
    end
  end
end
