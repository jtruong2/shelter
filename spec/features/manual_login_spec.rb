require 'rails_helper'
RSpec.describe "User can create an account for manual login" do
  it "creates a manual login" do
    user = create(:user)

    visit '/'
    click_on "Manual"
    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in("user[first_name]", with: user.first_name)
    fill_in("user[last_name]", with: user.last_name)
    fill_in("user[email]", with: user.email)
    fill_in("user[password]", with: user.password)
    fill_in("user[password_confirmation]", with: user.password)
    click_on "Register"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.email}")
  end

  it "logs into account with valid credentials" do
    user = create(:user)

    visit '/'
    click_on "Manual"
    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: user.password)
    click_on "Sign In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.email}")
  end
end
