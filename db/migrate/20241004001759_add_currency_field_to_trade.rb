class AddCurrencyFieldToTrade < ActiveRecord::Migration[8.0]
  def change
    add_column :account_trades, :currency, :string
  end
end
