FactoryBot.define do
  factory :user do
    name {"Gog FOd"}
    role { "admin" }
    email { "test@example.com" }
    password { "password" }
    company { create(:company)}
  end
end
