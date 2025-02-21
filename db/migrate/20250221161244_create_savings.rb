class CreateSavings < ActiveRecord::Migration[7.1]
  def change
    create_table :savings do |t|
      t.string :transaction_type
      t.integer :amount
      t.text :reason
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
