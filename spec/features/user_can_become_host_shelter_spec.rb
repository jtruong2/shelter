require 'rails_helper'

RSpec.describe "User Can Sign In Through Google" do
  it "Sees that home Page with User name" do
    Role.create(name: "user")

    stub_omniauth

    visit '/'

    click_on "Login"

    expect(current_path).to eq login_path

    click_on "Sign In With Google"

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

  it "Guest_User Can't Sign up as a Host with Out Signing up First" do
    visit '/'

    expect(page).to_not have_content "Become Host Shelter"
  end
end
