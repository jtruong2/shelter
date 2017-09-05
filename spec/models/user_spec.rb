require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    Role.create(name: "user")
  end
  it "creates a user with an associated role" do
  user = create(:user)

    expect(user).to respond_to(:roles)
    expect(user.roles).to eq User.last.roles
    expect(user.roles.count).to eq 1

    expect(user).to respond_to(:user?)
    expect(user.user?).to eq true

    expect(user).to respond_to(:first_name)
    expect(user).to respond_to(:last_name)
    expect(user).to respond_to(:email)
    expect(user).to respond_to(:image)
    expect(user).to respond_to(:token)
    expect(user).to respond_to(:owner!)
  end

  it "created user can become an owner" do
    Role.create(name: "owner")

    user = User.create(
      first_name: "Bart",
      last_name: "Starr",
      email: "bart@starr.com",
      password: "password"
    )

    user.owner!

    expect(user.roles).to eq User.last.roles

    expect(user.roles.count).to eq 2

    expect(user.first_name).to eq "Bart"
    expect(user.last_name).to eq "Starr"
    expect(user.email).to eq "bart@starr.com"
    expect(user.roles.first.name).to eq "user"
    expect(user.roles.second.name).to eq "owner"

    expect(user.user?).to eq true
    expect(user.owner?).to eq true
  end

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

end
