require 'rails_helper'

RSpec.describe "User email" do
  describe "ContactForm" do
    it "delivers a valid message" do
      user = create(:user)

      visit contact_form_new_path
      fill_in 'name', :with => user.first_name +' '+ user.last_name
      fill_in 'email', :with => user.email
      fill_in "subject", :with => "Test"
      fill_in "message", :with => "I have a problem. Please help."
      click_on 'Send message'

      page.body.should have_content("We'll get back to you shortly")
      last_email.to.should include(user.email)
      last_email.to.should include("admin@shelter.org")
    end
  end
end
