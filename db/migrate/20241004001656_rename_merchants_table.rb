class RenameMerchantsTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :transaction_merchants, :merchants
  end
end
