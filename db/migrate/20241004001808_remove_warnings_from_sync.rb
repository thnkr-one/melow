class RemoveWarningsFromSync < ActiveRecord::Migration[8.0]
  def change
    remove_column :account_syncs, :warnings, :text, array: true, default: []
  end
end
