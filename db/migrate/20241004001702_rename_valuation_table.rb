class RenameValuationTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :valuations, :account_valuations
  end
end
