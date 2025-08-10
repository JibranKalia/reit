class CreateInvestments < ActiveRecord::Migration[8.0]
  def change
    create_table :investments do |t|
      t.integer :month
      t.string :date
      t.decimal :target, default: 0
      t.decimal :actual, default: 0
      t.decimal :dividend, default: 0
      t.text :notes

      t.timestamps
    end
  end
end