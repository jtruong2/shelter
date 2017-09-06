require 'rails_helper'

RSpec.feature "Property owner" do
#As an owner
  scenario "views reservations for property and can change status" do
    user = create(:user_with_properties_and_roles)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/host_shelters/properties"
save_and_open_page
#I see a list of approved reservations for my property
    expect(page).to have_css(".approved", :count => 1)
#I see a list of current reservation requests for my property
    expect(page).to have_css(".pending", :count => 1)
#I see a list of complete requests for my property
    expect(page).to have_css(".complete", :count =>1)
#I see the current occupancy for my property
    expect(page).to have_field("Rooms Available", 4)
#And I can click on "Accept" to approve the reservation
    click_button "Accept", :first
#And the status for the reservation will be updated
    expect(page).to have_css(".approved", :count => 3)
#And the occupancy will be updated based on the size of the party in the "Accepted" reservation
#And I can click on "Cancel" on a pending reservation to cancel the reservation
    click_button "Cancel", :first
#And the reservation will be removed from my property
    expect(page).to have_css(".pending", :count => 1)
#And I can click on "Complete" on an accepted reservation
    click_button "Complete", :first
#And the status on the reservation will change
    expect(page).to have_css(".complete", :count => 3)
  end
end
