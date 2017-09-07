require 'rails_helper'
RSpec.describe ContactForm, type: :model do
  it "users contact support" do
    content = {name: "Samuel", email: "sam@aol.com", message: "Help!"}
    mail = ContactForm.send_message(content)

    expect(mail).to eq(true)
  end
end
