require 'rails_helper'

RSpec.describe Role, type: :model do
  context "complete associations test"
  it "creates a user with an associated role" do
    role = Role.create(name: "user")
    user = User.create(
        first_name: "Bart",
        last_name: "Starr",
        email: "bart@starr.com"
      )

      user_two = User.create(
          first_name: "Tommy",
          last_name: "Armstrong",
          email: "is@washedout.com"
        )

    expect(role).to respond_to(:users)
    expect(role.users).to eq [user, user_two]
    expect(role.users.count).to eq 2
    end
end
