 FactoryGirl.define do
   factory :property do
     street_address "MyString"
     city "MyString"
     state "MyString"
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
