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

RSpec.describe Company, type: :model do

  describe 'associations' do
    it { should have_many(:users).dependent(:destroy) }
    it { should have_many(:cards).through(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cnpj) }
    it { should validate_uniqueness_of(:cnpj) }
  end
end
