# frozen_string_literal: true

# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  category   :string(255)
#  cost       :integer          not null
#  merchant   :string(255)      not null
#  proof      :string(255)
#  status     :string(255)      default("unverified"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :bigint
#
# Indexes
#
#  index_expenses_on_card_id  (card_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#
# spec/factories/expenses.rb
FactoryBot.define do
  factory :expense do
    merchant { 'Sample Merchant' }
    cost { 10_000 }
    status { 'unverified' }
    category { 'Food' }
    proof { 'sample_proof.png' }
    association :card

    trait :verified do
      status { 'verified' }
    end

    trait :archived do
      status { 'archived' }
    end
  end
end
