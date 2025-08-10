class CreateInvestments < ActiveRecord::Migration[8.0]
  def change
    create_table :investments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :month
      t.string :date
      t.decimal :target, precision: 10, scale: 2
      t.decimal :actual, precision: 10, scale: 2
      t.decimal :dividend, precision: 10, scale: 2
      t.text :notes

      t.timestamps
    end
    
    add_index :investments, :month
  end
end
