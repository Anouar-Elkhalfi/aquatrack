class CreateConsumptions < ActiveRecord::Migration[7.1]
  def change
    create_table :consumptions do |t|
      t.references :user, null: false, foreign_key: true
      t.float :quantity
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
