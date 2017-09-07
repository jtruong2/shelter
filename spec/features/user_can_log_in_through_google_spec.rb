require 'rails_helper'

RSpec.describe "User Can Sign In And Out Through Google" do
  it "Sees that home Page with User name" do
    VCR.use_cassette("features/user_sees_home_page") do
      Role.create(name: "user")
      user = create(:user)

      visit '/'

      click_on "Manual"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: "password")
      click_on "Sign In"

      expect(current_path).to eq root_path
      expect(page).to_not have_content "Login"

      expect(page).to have_content "Logout"

      find('.logout-button').click

      expect(current_path).to eq root_path
      expect(page).to_not have_content "Welcome, #{user.email}"
      expect(page).to have_content "Login"
    end
  end
end
