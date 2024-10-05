class AddTransferFieldsToTransaction < ActiveRecord::Migration[8.0]
  def change
    change_table :transactions do |t|
      t.references :transfer, foreign_key: true, type: :uuid
      t.boolean :marked_as_transfer, default: false, null: false
    end
  end
end
