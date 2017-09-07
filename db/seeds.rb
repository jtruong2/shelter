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
  user1 = User.create(first_name: "Peyton", last_name: "Manning", email: "football@email.com", password: "superbowl")
  user2 = User.create(first_name: "Johnny", last_name: "Unitas", email: "football1@email.com", password: "superbowl")
  user3 = User.create(first_name: "Warren", last_name: "Moon", email: "football2@email.com", password: "oilers")
  user4 = User.create(first_name: "John", last_name: "Elway", email: "football3@email.com", password: "broncos")
  user1.roles << Role.find_by(name: "user")
  user1.roles << Role.find_by(name: "owner")
  user2.roles << Role.find_by(name: "user") 
  user3.roles << Role.find_by(name: "user")
  user4.roles << Role.find_by(name: "user")
end 

def seed_properties
  Property.create(street_address: "1 E 161st St", city: "Bronx", state: "NY", rooms_available: 100, user_id: 1)
  Property.create(street_address: "1060 W Addison St", city: "Chicago", state: "IL", rooms_available: 100, user_id: 1)
  Property.create(street_address: "4 Yawkey Way Ext", city: "Boston", state: "MA", rooms_available: 100, user_id: 1)
end

def seed_reservations
  Reservation.create(property_id: 1, user_id: 2, room_request: 50)
  Reservation.create(property_id: 1, user_id: 3, room_request: 50)
  Reservation.create(property_id: 2, user_id: 4, room_request: 75)
end

seed_roles
seed_users
seed_properties
seed_reservations
