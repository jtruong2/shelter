
require 'rails_helper'

RSpec.describe "User Facebook OAuth Process" do

  before(:each) do
    stub_omniauth
  end

  it "guest can create an account" do

    visit '/'

    click_on '/auth/facebook'
    # visit facebook_login_path

    expect(page).to have_field("user[first_name]", with: 'Mark')
    expect(page).to have_field("user[last_name]", with: 'Van Akkeren')
    expect(page).to have_field('user[email]', with: 'markavan@hotmail.com')

    # fill_in "user[zipcode]", with: "80305"
    # fill_in "user[phone_number]", with: "1234567890"

    click_on "Create Account"

    expect(current_path).to eq(twilio_confirmation_path)

    last_message = FakeSMS.messages.last

    fill_in "code_verification[code]", with: last_message.body

    click_on "Verify"

    expect(current_path).to eq(dashboard_path)

    latest_user = User.last

    expect(latest_user.first_name).to eq("Riley")
    expect(latest_user.email).to eq("rileyt_111@hotmail.com")
  end
end
