FactoryGirl.define do
  factory :user do
    # uid "MyString"
    sequence :first_name do |x|
      "Samuel #{x}"
    end
    sequence :last_name do |x|
      "L. Homie #{x}"
    end
    sequence :email do |x|
      "i_need_a_homie#{x}@netscape.com"
    end
    password "password"
    # token "MyString"
    # image "MyString"

    factory :user_with_user_role do
      before(:create) do |user|
        create(:role, name: "user", users: [user])
      end
    end

    factory :user_with_properties_and_roles do

      before(:create) do |user|
        create(:role, name: "user", users: [user])
      end

      after(:create) do |user|
        create(:role, name: "owner", users: [user])
      end

      after(:create) do |user|
        create(:property, :user => user)
      end

      after(:create) do |user|
        create(:property, :user => user)
      end

      after(:create) do |user|
        create(:property, :user => user)
      end
    end
  end
end
