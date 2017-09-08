class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  enum status: %w(pending approved completed cancelled)
end
