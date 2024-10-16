class ChangeTransactionCategoryDeleteBehavior < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :transactions, :transaction_categories, column: :category_id
    add_foreign_key :transactions, :transaction_categories, column: :category_id, on_delete: :nullify
  end
end
