class AddLastSyncDateToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :last_sync_date, :date
  end
end
