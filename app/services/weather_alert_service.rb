class WeatherAlertService
  def initialize(state=nil)
    @base  = "https://api.weather.gov/"
    @state = state
  end

  def self.find_national_alerts
    new().find_all_alerts
  end

  def self.find_alerts_for(state)
    new(state).find_my_alerts
  end

  def find_all_alerts
    get_url(base+"alerts/active?limit=20")
  end

  def find_my_alerts
    get_url(base+"alerts/active/area/#{state}?limit=20")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)[:features]
  end

  private

  attr_reader :base, :state

end
