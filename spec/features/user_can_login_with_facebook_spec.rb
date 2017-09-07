require 'rails_helper'

RSpec.describe "User Can Sign In And Out Through Facebook" do

  before(:each) do
    stub_omniauth
  end

  it "guest can create an account" do

    visit facebook_login_path

    expect(page).to have_field("user[first_name]", with: 'Mark`')
    expect(page).to have_field("user[last_name]", with: 'Van Akkeren')
    expect(page).to have_field('user[email]', with: 'markavan@hotmail.com')

    click_on "Create Account"

    expect(current_path).to eq(twilio_confirmation_path)

    last_message = FakeSMS.messages.last

    fill_in "code_verification[code]", with: last_message.body

    click_on "Verify"

    expect(current_path).to eq(dashboard_path)

    latest_user = User.last

    expect(latest_user.first_name).to eq("Mark")
    expect(latest_user.email).to eq("markavan@hotmail.com")

  end
end
