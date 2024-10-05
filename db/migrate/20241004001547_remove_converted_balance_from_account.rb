class RemoveConvertedBalanceFromAccount < ActiveRecord::Migration[8.0]
  def change
    remove_column :accounts, :converted_balance, :decimal
    remove_column :accounts, :converted_currency, :string
  end
end
