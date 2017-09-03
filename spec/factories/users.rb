FactoryGirl.define do
  factory :user do
    Role.create(name: 'user')
    # uid "MyString"
    first_name "Samuel"
    last_name "L. Homie"
    email "i_need_a_homie@netscape.com"
    password "password"
    # token "MyString"
    # image "MyString"
  end
end
