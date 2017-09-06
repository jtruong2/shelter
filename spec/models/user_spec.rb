require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
end

describe User do
  let(:user) { User.make }

  it "sends an email" do
    expect { user.send_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
