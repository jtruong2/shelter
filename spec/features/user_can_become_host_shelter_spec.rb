require 'rails_helper'

RSpec.describe "User Can Sign In Through Google" do
  it "Sees that home Page with User name" do
    Role.create(name: "user")

    stub_omniauth

    visit '/'

    click_on "Become Host Shelter"

    expect(current_path).to eq host_shelters_sign_up_path

    fill_in "Street Address", with: "123 Circle Drive"
    fill_in "City", with: "Denver"
    fill_in "State", with: "Colorado"
    fill_in "Available Rooms", with: 2

    expect(current_path).to eq host_shelters_path(Property.last.id)
  end
end
