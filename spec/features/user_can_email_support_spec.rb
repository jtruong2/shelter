require 'rails_helper'

RSpec.describe "User email" do
  it "delivers a valid message" do
    ActionMailer::Base.deliveries.clear

    visit new_contact_form_path
    fill_in("contact_form[name]", with: "Samuel")
    fill_in("contact_form[email]", with: "Sam@aol.com")
    fill_in("contact_form[message]", with: "I have snakes on a plane. Please help.")
    click_on 'Send message'

    expect(page).to have_content("Thank you for your response, We'll get back to you shortly")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
