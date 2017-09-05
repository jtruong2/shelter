class Property < ApplicationRecord
  before_save :address
  before_save :latitude_look_up
  before_save :longitude_look_up

  belongs_to :user

  def address
    self.address = "#{street_address}, #{city}, #{state}"
  end

  def longitude_look_up
    self.longitude = Geocoder.coordinates(self.address).last
  end

  def latitude_look_up
    self.latitude = Geocoder.coordinates(self.address).first
  end
end
