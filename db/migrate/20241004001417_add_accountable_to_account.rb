class AddAccountableToAccount < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :accountable_type, :string
    add_column :accounts, :accountable_id, :uuid
    add_index :accounts, :accountable_type
  end
end
