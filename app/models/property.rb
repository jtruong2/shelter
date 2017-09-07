class Property < ApplicationRecord
  belongs_to :user

  def self.search(location)
    location = location[:search]
    where("street_address ILIKE ? OR city ILIKE ? OR state ILIKE ?", "%#{location}%", "%#{location}%", "%#{location}%")
  end
end
