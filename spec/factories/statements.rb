# == Schema Information
#
# Table name: statements
#
#  id             :bigint           not null, primary key
#  cost           :integer
#  merchant       :string(255)
#  performed_at   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint
#  transaction_id :integer
#
# Indexes
#
#  index_statements_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :statement do
    performed_at { "" }
    cost { 1 }
    merchant { "MyString" }
    transaction_id { 1 }
    category { nil }
  end
end
