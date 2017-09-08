@props = [["11001 OWINGS MILLS ROAD", "OWINGS MILLS", "MD", "21117"],
          ["ONE BILLS DRIVE", "ORCHARD PARK", "NY", "14127"],
          ["ONE PAUL BROWN STADIUM", "CINCINNATI", "OH", "45202"],
          ["76 LOU GROZA BLVD.", "BEREA", "OH", "44017"],
          ["13655 BRONCOS PARKWAY", "ENGLEWOOD", "CO", "80112"],
          ["TWO RELIANT PARK", "HOUSTON", "TX", "77054"],
          ["7001 W. 56TH STREET", "INDIANAPOLIS", "IN", "46254"],
          ["ONE STADIUM PLACE", "JACKSONVILLE", "FL", "32202"],
          ["ONE ARROWHEAD DRIVE", "KANSAS CITY", "MO", "64129"],
          ["7500 SW 30TH STREET", "DAVIE", "FL", "33314"],
          ["ONE PATRIOT PLACE", "FOXBORO", "MA", "02035-1388"],
          ["1000 FULTON AVE. HEMPSTEAD", "NY", "11550"],
          ["1220 HARBOR BAY PARKWAY", "ALAMEDA", "CA", "94502"],
          ["3400 SOUTH WATER STREET", "PITTSBURGH", "PA", "15203"],
          ["4020 MURPHY CANYON ROAD", "SAN DIEGO", "CA", "92123"],
          ["11220 N.E.53RD STREET", "KIRKLAND", "WA", "98033"],
          ["460 GREAT CIRCLE ROAD", "NASHVILLE", "TN"],
          ["8701 S.HARDY DRIVE", "TEMPE", "AZ", "85284"],
          ["4400 FALCON PARKWAY", "FLOWERY BRANCH", "GA", "30542"],
          ["800 S.MINT STREET", "CHARLOTTE", "NC", "28202"],
          ["1000 FOOTBALL DRIVE", "LAKE FOREST", "IL", "60045"],
          ["1 COWBOYS PARKWAY", "IRVING", "TX", "75063-4727"],
          ["222 REPUBLIC DRIVE", "ALLEN PARK", "MI", "48101"],
          ["1265 LOMBARDI AVENUE", "GREEN BAY", "WI", "54304"],
          ["9520 VIKING DRIVE", "EDEN PRAIRIE", "MN", "55344"],
          ["5800 AIRLINE DRIVE", "METAIRIE", "LA", "70003"],
          ["ONE NOVACARE WAY"," PHILADELPHIA", "PA", "19145"],
          ["4949 CENTENNIAL BLVD.", "SANTA CLARA","CA", "95054-1229"],
          ["1 RAMS WAY, ST.LOUIS","MO", "63045"],
          ["ONE BUCCANEER PLACE", "TAMPA","FL", "33607"],
          ["21300 REDSKIN PARK DRIVE", "ASHBURN","VA", "20147"],
          ["2695 E. Katella Ave.","Anaheim", "CA", "92803"],
          ["1 Phillips Drive", "Atlanta", "GA", "30303"],
          ["1 Fleet Center", "Boston", "MA", "02114-1303"],
          ["1901 W. Madison St.", "Chicago", "IL", "60612"],
          ["100 Chopper Place Denver", "CO", "80204"],
          ["211 Cowboys Parkway Irving", "TX", "75063"],
          ["600 Civic Center Detroit", "MI", "48226"],
          ["1111 S. Figueroa St.", "Los Angeles", "CA", "90015"],
          ["Kellogg Blvd. Saint Paul.", "Minneapolis", "MN", "55105"],
          ['501 Broadway', 'Nashville','TN', '37203'],
          ["2 Penn Plaza", "New York", "NY", "10121"],
          ["9375 E. Bell Road", "Scottsdale", "Arizona", "85257"],
          ["66 Mario Lemieux Place", "Pittsburgh", "PA", "15219"],
          ["525 W. Santa Clara St.", "San Jose", "CA", "95113"],
          ["1401 Clark Ave.", "St. Louis", "MO", "63103-2709"],
          ["401 Channelside Dr.", "Tampa", "FL", "33602"]]

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
  puts "owners created"
end

def seed_owners
  @users.each {|user| user.owner!}
  puts "owners assigned"
end

def seed_properties
  counter = 0
  until counter == @props.length
    property = @users.sample.properties.create(:street_address => @props[counter][0],
                                   :city => @props[counter][1],
                                   :state => @props[counter][2],
                                   :rooms_available => Faker::Number.between(1, 10)
                                  )
                                  counter += 1
    puts "Property #{counter} @ #{property.street_address} in #{property.state} created"
  end
end

seed_roles
seed_users
user_owners
seed_owners
seed_properties

