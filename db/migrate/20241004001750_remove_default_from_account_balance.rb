class RemoveDefaultFromAccountBalance < ActiveRecord::Migration[8.0]
  def change
    change_column_default :accounts, :balance, from: "0.0", to: nil
    change_column_default :accounts, :currency, from: "USD", to: nil
  end
end
