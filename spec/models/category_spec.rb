# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_categories_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require 'rails_helper'

RSpec.describe Category do
  let(:company) { create(:company) }
  let(:category) { create(:category, company: company) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category.name = nil
      expect(category).not_to be_valid
    end

    it 'is not valid without a company' do
      category.company = nil
      expect(category).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to a company' do
      expect(category.company).to eq(company)
    end
  end
end
