 FactoryGirl.define do
   factory :property do
     sequence :street_address do |x|
      "#{x} Sesame Street"
     end
     city "Gotham City"
     state "MN"
     rooms_available 1
     user

     factory :property_with_reservations do
       transient do
         reservations_count 2
       end

       after(:create) do |profile, evaluator|
         create_list(:reservation, evaluator.reservations_count, property: [property])
       end
     end
   end
 end
