class AddNotesAndExcludedToTransaction < ActiveRecord::Migration[8.0]
  def change
    add_column :transactions, :excluded, :boolean, default: false
    add_column :transactions, :notes, :text
  end
end
