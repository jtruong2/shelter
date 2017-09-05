FactoryGirl.define do
  factory :property do
    street_address "2001 Blake St"
    city "Denver"
    state "CO"
    rooms_available 1
    user
  end
end
