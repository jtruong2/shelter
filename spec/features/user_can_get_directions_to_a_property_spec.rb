require "rails_helper"

RSpec.describe "Guest Can Visit Property Show Page" do
  context "and get directions" do
    it "without a current location" do
      VCR.use_cassette("features/user_gets_directions") do
        role = create(:role)
        prop = create(:property)
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/host_shelters/#{prop.id}"

        fill_in :my_local, with: "1331 17th St, Denver, CO"
        click_on "Take Me to the Homies"

        expect(current_path).to eq("/host_shelters/properties/#{prop.id}/directions")

        expect(page).to have_content("6 Steps")
        expect(page).to have_css(".direction")

        within first(".direction") do
          expect(page).to have_css(".instruction")
          expect(page).to have_css(".duration")
          expect(page).to have_css(".distance")
        end
      end
    end
  end
end
