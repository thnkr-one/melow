class AddLastSyncedAtToFamily < ActiveRecord::Migration[8.0]
  def change
    add_column :families, :last_synced_at, :datetime
  end
end
