class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :store_type, null: false, foreign_key: true, type: :uuid
      t.string :month
      t.integer :year
      t.integer :amount

      t.timestamps
    end
  end
end
