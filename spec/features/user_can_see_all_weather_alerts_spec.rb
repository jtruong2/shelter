require 'rails_helper'

describe "User can see all weather alerts" do
  scenario "sends default request" do
    visit "/"
    click_on "View Weather Alerts"
    expect(current_path).to eq("/alerts")

    expect(page).to have_css(".alerts")
    binding.pry

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
