class RenameCategoriesTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :transaction_categories, :categories
  end
end
