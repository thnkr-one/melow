class AddIsActiveToAccount < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :is_active, :boolean, default: true, null: false
  end
end
