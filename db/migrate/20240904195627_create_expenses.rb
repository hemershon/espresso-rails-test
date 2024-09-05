class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :merchant, null: false
      t.integer :cost, null: false
      t.string :status, null: false, default: "unverified"
      t.string :category
      t.string :proof
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
