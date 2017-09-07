class Direction
  attr_reader :steps, :duration, :distance, :start_address, :end_address

  def initialize(directions)
    @steps         = re_format(directions[:steps])
    @duration      = directions[:duration][:text]
    @distance      = directions[:distance][:text]
    @start_address = directions[:start_address]
    @end_address   = directions[:end_address]
  end

  def self.take_me_to(location, destination)
    new_location = address_formatter(location)
    new_destination = address_formatter(destination)
    new(DirectionService.find_directions(new_location, new_destination))
  end

  def re_format(steps)
    steps.map do |attr|
      DirectionStep.new(attr)
    end
  end

  def self.address_formatter(address)
    address.delete(",").gsub!(" ", "+")
  end
end
