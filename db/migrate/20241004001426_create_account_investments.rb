class CreateAccountInvestments < ActiveRecord::Migration[8.0]
  def change
    create_table :account_investments, id: :uuid do |t|
      t.timestamps
    end
  end
end
