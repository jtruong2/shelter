require 'rails_helper'
RSpec.feature "Property owner" do
  scenario "views properties and approves reservations" do
    role = create(:role, name: "user")
    role2 = create(:role, name: "owner")
    user = create(:user)
    user2 = create(:user)
    user.roles << role2
    property = create(:property, user_id: user.id)
    reservation = create(:reservation, user_id: user2.id, property_id: property.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/host_shelters/properties'
    expect(current_path).to eq(host_shelters_properties_path)
    expect(page).to have_css("p.pending")
    expect(page).to have_button("Approve")
    expect(page).to have_button("Cancel")
    click_button "Approve"
    expect(page).to have_css("p.approved")
    expect(page).to have_button("Complete")
  end
  scenario "views properties and cancels reservations" do
    role = create(:role, name: "user")
    role2 = create(:role, name: "owner")
    user = create(:user)
    user2 = create(:user)
    user.roles << role2
    property = create(:property, user_id: user.id)
    reservation = create(:reservation, user_id: user2.id, property_id: property.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/host_shelters/properties'

    click_on "Cancel"
    expect(page).to_not have_css("p.approved")
    click_on "Cancelled Requests"
    expect(page).to have_css("p.cancelled")
  end
  scenario "views properties and completes reservations" do
    role = create(:role, name: "user")
    role2 = create(:role, name: "owner")
    user = create(:user)
    user2 = create(:user)
    user.roles << role2
    property = create(:property, user_id: user.id)
    reservation = create(:reservation, user_id: user2.id, property_id: property.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/host_shelters/properties'
    click_button "Approve"
    click_button "Complete"
    expect(page).to have_css("p.completed")
    expect(page).to_not have_css("p.pending")
    expect(page).to_not have_css("p.approved")
  end
end
