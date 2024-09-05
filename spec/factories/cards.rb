FactoryBot.define do
  factory :card do
    last4 { "1234" }
    association :user
  end
end
