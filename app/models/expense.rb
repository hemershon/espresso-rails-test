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
class Expense < ApplicationRecord
  belongs_to :card
  has_one :user, through: :card

  has_one_attached :proof

  validates :merchant, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[unverified verified archived] }

  before_save :convert_cost_to_real, if: :new_record?

  private

  def convert_cost_to_real
    self.cost = cost.to_f / 100
  end
end
