class RenameTransactionsTable < ActiveRecord::Migration[8.0]
  class Tagging < ActiveRecord::Base
  end

  def change
    rename_table :transactions, :account_transactions

    reversible do |dir|
      dir.up do
        Tagging.where(taggable_type: 'Transaction').update_all(taggable_type: "Account::Transaction")
      end

      dir.down do
        Tagging.where(taggable_type: 'Account::Transaction').update_all(taggable_type: "Transaction")
      end
    end
  end
end
