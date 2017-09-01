require 'rails_helper'

RSpec.describe "User Can Sign In Through Google" do
  it "Sees that home Page with User name" do

    stub_omniauth

    visit '/'

    click_on "Login"

    expect(current_path).to eq login_path

    click_on "Google"

    expect(current_path).to eq root_path
    expect(page).to have_content "homies@shelteredhomies.com"
    expect(page).to_not have_content "Login"
  end
end
