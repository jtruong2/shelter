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
  user = User.create(first_name: "Peyton",last_name: "Manning", email: "football@email.com", password: "superbowl")
  user.roles << Role.find_by(name: "user")
  user.roles << Role.find_by(name: "owner")
end 

def seed_properties
  Property.create(street_address: "1 E 161st St", city: "Bronx", state: "NY", rooms_available: 100, user_id: 1, status: 0)
  Property.create(street_address: "1060 W Addison St", city: "Chicago", state: "IL", rooms_available: 100, user_id: 1, status: 1)
  Property.create(street_address: "4 Yawkey Way Ext", city: "Boston", state: "MA", rooms_available: 100, user_id: 1, status: 2)
end

seed_roles
seed_users
seed_properties
