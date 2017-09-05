require 'rails_helper'

describe "User can see all weather alerts for state" do
  scenario "sends state request" do
    visit "/"
    fill_in :state, with: "TX"
    click_on "Search"

    expect(current_path).to eq("/alerts")

    expect(page).to have_css(".alert")
    expect(page).to have_content("Texas")

    within first(".alert") do
      expect(page).to have_css(".event")
      expect(page).to have_css(".headline")
      expect(page).to have_css(".description")
      expect(page).to have_css(".instructions")
      expect(page).to have_css(".severity")
      expect(page).to have_css(".urgency")
    end
  end
end
