require 'rails_helper'

RSpec.describe "User Can Sign In Through Google" do

  it "Sees that home Page with User name" do
    VCR.use_cassette("features/user_becomes_host") do

      Role.create(name: "user")
      Role.create(name: "owner")
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)


      visit '/'

      click_on "Manual"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: "password")
      click_on "Sign In"

      expect(current_path).to eq root_path

      click_on "Become Host Shelter"

      expect(current_path).to eq host_shelters_sign_up_path

      fill_in 'property[street_address]', with: "123 Circle Drive"
      fill_in "property_city", with: "Denver"
      select "Colorado", from: "property_state"
      fill_in "property_rooms_available", with: 2

      click_on "Create Host Shelter"

      expect(current_path).to eq host_shelters_path(Property.last.id)
    end
  end


  it "Guest_User Can't Sign up as a Host with Out Signing up First" do
    VCR.use_cassette("features/user_cant_be_host") do

      visit '/'

      expect(page).to_not have_content "Become Host Shelter"
    end
  end


  it "Guest_User Can't Visti Sign up URL with Out Signing up First" do
    VCR.use_cassette("features/user_cant_visit_sign_up") do

      visit '/host_shelters/sign_up'

      expect(page).to_not have_content "Page Not Found"
    end
  end
end
