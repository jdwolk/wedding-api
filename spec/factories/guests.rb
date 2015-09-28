FactoryGirl.define do
  factory :guest do
    first_name 'FIRST'
    last_name 'LAST'
    sequence(:email) { |n| "guest#{n}@example.com" }
  end
end
