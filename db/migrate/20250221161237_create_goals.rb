class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :target_amount
      t.integer :saved_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
