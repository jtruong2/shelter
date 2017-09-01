require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a user with an associated role" do
    Role.create(name: "user")
    user = User.create(
        first_name: "Bart",
        last_name: "Starr",
        email: "bart@starr.com"
      )
    expect(user.roles).to eq User.last.roles
    expect(user.roles.count).to eq 1
    expect(user.user?).to eq true
  end

  it "created user can become an owner" do
    Role.create(name: "user")
    Role.create(name: "owner")

    user = User.create(
        first_name: "Bart",
        last_name: "Starr",
        email: "bart@starr.com"
      )

    user.owner!

    expect(user.roles).to eq User.last.roles
    expect(user.roles.count).to eq 2
    expect(user.user?).to eq true
    expect(user.owner?).to eq true
  end
end
