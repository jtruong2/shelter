class Property < ApplicationRecord
  belongs_to :user

  enum status: %w(pending, approved, complete, cancelled)
end
