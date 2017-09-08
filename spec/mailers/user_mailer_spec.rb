require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  it 'sends welcome mail to user' do
    user = User.new(first_name: "Samuel", last_name: "L. Jackson", email: "sam@aol.com", password: "password")
    mail = UserMailer.welcome_email(user)

    expect(mail.to.first).to eq("sam@aol.com")
    expect(mail.subject).to eq("Welcome, We're happy to have you with us")
  end
end
