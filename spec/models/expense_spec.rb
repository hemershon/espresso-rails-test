# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  category   :string(255)
#  cost       :integer
#  merchant   :string(255)
#  proof      :string(255)
#  status     :string(255)
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
  pending "add some examples to (or delete) #{__FILE__}"
end
