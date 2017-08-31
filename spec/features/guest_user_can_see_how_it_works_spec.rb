require 'rails_helper'

RSpec.describe "Guest Visits Home Page" do
  it "sees About and How it works link/s for each" do

    visit '/'

    expect(current_path).to eq root_path
    expect(page).to have_css ".about-btn"
    expect(page).to have_css ".info-btn"
  end

  it "clicks on about link" do
    visit '/'

    click_on "About"

    expect(current_path).to eq about_path
    expect(page).to have_content "Turing"
    expect(page).to have_content "Do NOT Use"
  end

  it "clicks on How It Works link" do
    visit '/'

    click_on "How It Works"

    expect(current_path).to eq info_path
    expect(page).to have_content "For Families and Individuals in Need"
    expect(page).to have_content "Host Shelters"
  end
end
