# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :cnpj, null: false, unique: true

      t.timestamps
    end
  end
end
