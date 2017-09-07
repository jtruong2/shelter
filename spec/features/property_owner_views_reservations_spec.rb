require 'rails_helper'

RSpec.feature "Property owner" do
  scenario "views pending reservations for property and can change status" do
    user = create(:user_with_properties_and_roles)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/host_shelters/properties"

    expect(page).to have_css("p.approved", :count => 1)
    expect(page).to have_css("p.pending", :count => 1)
    expect(page).to have_css("p.complete", :count =>1)
    expect(page).to have_content("Rooms Available", 3)

    click_button "Approve"

#And the occupancy will be updated based on the size of the party in the "Accepted" reservation

    expect(page).to have_css("p.approved", :count => 2)
  end

  scenario "views approved reservations and can change status" do
    user = create(:user_with_properties_and_roles)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/host_shelters/properties"

    expect(page).to have_css("p.approved", :count => 1)
    expect(page).to have_css("p.pending", :count => 1)
    expect(page).to have_css("p.complete", :count =>1)
    expect(page).to have_content("Rooms Available", 3)

    click_on "Complete"
save_and_open_page
    expect(page).to have_css("p.pending", :count => 1)
#And I can click on "Complete" on an accepted reservation
    click_button "Complete", :first
#And the status on the reservation will change
    expect(page).to have_css("p.complete", :count => 3)
#And I can click on "Cancel" on a pending reservation to cancel the reservation
    click_button "Cancel", :first
#And the reservation will be removed from my property
  end
end
