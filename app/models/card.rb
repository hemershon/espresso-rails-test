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
class Card < ApplicationRecord
  belongs_to :user

  has_many :expenses, dependent: :destroy

  validates :last4, presence: true, length: { is: 4 }
end
