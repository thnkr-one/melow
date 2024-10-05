class CreateAccountCryptos < ActiveRecord::Migration[8.0]
  def change
    create_table :account_cryptos, id: :uuid do |t|
      t.timestamps
    end
  end
end
