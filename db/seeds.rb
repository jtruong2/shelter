# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_roles
  Role.create(name: "user")
  Role.create(name: "owner")
  Role.create(name: "platform_admin")
end

def seed_users
  counter = 0
  100.times do
    User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "password")
    counter += 1
    puts "User ##{counter} created"
  end
end

def user_owners
  @users = User.where(id: 0..10)
end

def seed_owners
  @users.each {|user| user.owner!}
end

def seed_properties
  1000.times do
    property = @users.sample.properties.create(:street_address => Faker::Address.street_address,
                                   :city => Faker::Address.city,
                                   :state =>Faker::Address.state,
                                   :rooms_available => Faker::Number.between(1, 10)
                                  )
    puts "Property #{property.street_address} created"
  end
end
seed_roles
seed_users
user_owners
seed_owners
seed_properties
