class AddSyncStatusFieldsToAccount < ActiveRecord::Migration[8.0]
  def change
    create_enum :account_status, %w[ok syncing error]

    remove_column :accounts, :status, :string

    change_table :accounts do |t|
      t.enum :status, enum_type: :account_status, default: "ok", null: false
      t.jsonb :sync_warnings, default: '[]', null: false
      t.jsonb :sync_errors, default: '[]', null: false
    end
  end
end
