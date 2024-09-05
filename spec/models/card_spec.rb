# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  last4      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_cards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { create(:user) }

  it { should belong_to(:user) }
  it { should have_many(:expenses).dependent(:destroy) }

  # Validações
  it { should validate_presence_of(:last4) }
  it { should validate_length_of(:last4).is_equal_to(4) }

  # Teste de fábrica (FactoryBot)
  describe "valid Card" do
    let(:user) { create(:user) }
    let(:card) { build(:card, user: user, last4: "1234") }

    it "is valid with valid attributes" do
      expect(card).to be_valid
    end

    it "is not valid without a last4" do
      card.last4 = nil
      expect(card).not_to be_valid
    end

    it "is not valid if last4 is not exactly 4 characters" do
      card.last4 = "123"
      expect(card).not_to be_valid
    end

  end
end
