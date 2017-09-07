class DirectionService
  def initialize(location, destination)
    @location    = location
    @destination = destination
    @base        = "https://maps.googleapis.com/maps/api/directions/json?"
    @key         = ENV["GOOGLE_MAPS_ID"]
  end

  def self.find_directions(location, destination)
    new(location, destination).get_directions
  end

  def get_directions
    get_url(base+"origin=#{location}&destination=#{destination}"+"&key=#{key}")
  end

  private

  attr_reader :location, :base, :destination, :key

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)[:routes].first[:legs].first
  end
end
