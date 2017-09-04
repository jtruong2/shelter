require 'rails_helper'

RSpec.describe "Host Shelter Owner Can" do

  before :each do
    Role.create(name: "user")
    Role.create(name: "owner")
    @user = create(:user)
  end

  it "Sees a list of their properties at the Properties Index Page" do
    @user.properties.create(street_address: "123 Circle Dr",
                                     city: "Denver",
                                    state: "Colorado",
                          rooms_available: 2
                                     )

  end
end
