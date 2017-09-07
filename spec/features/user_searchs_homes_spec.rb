require 'rails_helper'
RSpec.describe "User searches for homes" do
  it "finds homes by location" do
    create(:role)
    user = create(:user)
    Property.create(street_address: '123 Main st.', city: 'Denver', state: 'CO', rooms_available: 1, user_id: user.id)

    visit '/'
    fill_in(:search, with: "Denver")
    click_on "Find Homes"
    save_and_open_page
    expect(page).to have_content("123 Main st.")
  end
end
