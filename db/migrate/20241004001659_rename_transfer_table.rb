class RenameTransferTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :transfers, :account_transfers
  end
end
