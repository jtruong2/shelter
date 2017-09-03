class WeatherAlertService
  def initialize
    @base = "https://api.weather.gov/"
  end

  def self.find_national_alerts
    new().find_all_alerts
  end

  def find_all_alerts
    get_url(@base+"alerts/active")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)[:features]
  end
end
