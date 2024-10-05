class RemoveCurrencyTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :currencies
  end
end
