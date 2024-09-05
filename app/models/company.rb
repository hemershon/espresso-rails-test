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
class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :cards, through: :users

  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: true # , format: { with: /\A\d{14}\z/, message: "Valid CNPJ" }
end
