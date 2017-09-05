require "rails_helper"

RSpec.describe "Guest Can Visit Property Show Page" do
  context "and get directions" do
    it "without a current location" do
      prop = create(:property)

      visit "/host_shelters/#{prop.id}"

      fill_in :my_local, with: "1331 17th St, Denver, CO"
      click_on "Take Me to the Homies"

      expect(current_path).to eq("/host_shelters/#{prop.id}/directions")

      expect(page).to have_css(".instruction")

      within first(".instruction") do
        expect(page).to have_css(".instruction")
        expect(page).to have_css(".duration")
        expect(page).to have_content("6 Steps")
      end
    end
  end
end
