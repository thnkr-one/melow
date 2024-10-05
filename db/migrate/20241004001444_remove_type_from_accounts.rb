class RemoveTypeFromAccounts < ActiveRecord::Migration[8.0]
  def change
    remove_column :accounts, :type
  end
end
