FactoryGirl.define do
  factory :user do
    # uid "MyString"
    first_name "Samuel"
    last_name "L. Homie"
    sequence :email  do |i|
      "i_need_a_homi#{i}e@netscape.com"
    end
    password "password"
    # token "MyString"
    # image "MyString"
  end
end
