require 'rails_helper'
RSpec.describe "receives welcome email upon sign up" do
  include Mail::Matchers

  user = build(:user)

  visit '/'
  click_on 'Manual'
  click_on 'Register'
  fill_in("user[first_name]", with: user.first_name)
  fill_in("user[last_name]", with: user.last_name)
  fill_in("user[email]", with: user.email)
  fill_in("user[password]", with: user.password)
  fill_in("user[password_confirmation]", with: user.password)
  click_on "Register"

  it { is_expected.to have_sent_email.to(user.email) }
  end
end
