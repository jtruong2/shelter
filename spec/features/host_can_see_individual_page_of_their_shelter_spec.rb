require 'rails_helper'

RSpec.describe "Host Shelter Owner Can" do

  before :each do
    Role.create(name: "user")
    Role.create(name: "owner")
    @user = create(:user)
  end

  it "Sees a list of their properties at the Properties Show Page" do
    VCR.use_cassette("features/user_sees_their_properties") do
      property = @user.properties.create!(:street_address => "1701 Bryant St",
                              :city => "Denver",
                              :state => "CO",
                              :rooms_available => 2)

      @user.owner!

      allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(@user)

      visit "/host_shelters/#{property.id}"

      expect(@user.owner?).to eq true
      expect(current_path).to eq host_shelters_path(property.id)
      expect(page).to have_content @user.properties.first.street_address
      expect(page).to have_content @user.properties.first.city
      expect(page).to have_content @user.properties.first.state
      expect(page).to have_content @user.properties.first.rooms_available
   end
  end
end
