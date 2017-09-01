require 'rails_helper'
RSpec.describe "User can create an account for manual login" do
  it "creates a manaul login" do

    visit '/'
    click_on "Manual"

    expect(current_path).to eq(new_user_path)

    fill_in("user[first_name]", with: "Samuel")
    fill_in("user[last_name]", with: "L. Homie")
    fill_in("user[email]", with: "i_need_a_homie@netscape.com")
    fill_in("user[password]", with: "password")
    fill_in("user[password_confirmation]", with: "password")
    click_on "Register"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, i_need_a_homie@netscape.com")
  end
end
