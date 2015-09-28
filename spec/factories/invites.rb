FactoryGirl.define do
  factory :invite do
    association :inviter, factory: :admin
    association :invitee, factory: :guest
  end
end
