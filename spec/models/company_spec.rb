# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  cnpj       :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Company do
  describe 'associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }
    it { is_expected.to have_many(:cards).through(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cnpj) }
    it { is_expected.to validate_uniqueness_of(:cnpj) }
  end
end
