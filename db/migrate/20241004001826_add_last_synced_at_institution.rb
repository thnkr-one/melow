class AddLastSyncedAtInstitution < ActiveRecord::Migration[8.0]
  def change
    add_column :institutions, :last_synced_at, :datetime
  end
end
