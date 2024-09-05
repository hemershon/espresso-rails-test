# spec/factories/expenses.rb
FactoryBot.define do
  factory :expense do
    merchant { "Sample Merchant" }
    cost { 10000 }
    status { "unverified" }
    category { "Food" }
    proof { "sample_proof.png" }
    association :card

    trait :verified do
      status { "verified" }
    end

    trait :archived do
      status { "archived" }
    end
  end
end
