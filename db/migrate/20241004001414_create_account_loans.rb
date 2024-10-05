class CreateAccountLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :account_loans, id: :uuid do |t|
      t.timestamps
    end
  end
end
