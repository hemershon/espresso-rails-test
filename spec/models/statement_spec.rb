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
require 'rails_helper'

RSpec.describe Statement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
