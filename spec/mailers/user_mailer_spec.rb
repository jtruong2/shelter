require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    user = User.new(first_name: 'Sam', last_name: 'L. Jackson', email: 'Sam@aol.com', password: "password")
    let(:mail) { described_class.welcome_email(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Welcome, We're happy to have you with us")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['noreply@shelter.org'])
    end

    it 'assigns first_name' do
      expect(mail.body.encoded).to match(user.first_name)
    end

    it 'assigns @url' do
      expect(mail.body.encoded)
        .to match("http://shelter-in-need/login")
    end
  end
end
