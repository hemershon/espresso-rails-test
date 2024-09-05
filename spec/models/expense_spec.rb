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
require 'rails_helper'

RSpec.describe Expense, type: :model do

  describe 'associations' do
    it { should belong_to(:card) }
    it { should have_one(:user).through(:card) }
    it { should have_one_attached(:proof) }
  end


  describe 'validations' do
    it { should validate_presence_of(:merchant) }
    it { should validate_presence_of(:cost) }
    it { should validate_numericality_of(:cost).is_greater_than(0) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w[unverified verified archived]) }
  end


  describe 'callbacks' do
    it 'converts cost to real before saving a new record' do
      expense = Expense.new(merchant: 'Store', cost: 5000, status: 'verified', card: create(:card))
      expense.save
      expect(expense.cost).to eq(50.0)
    end
  end
end
