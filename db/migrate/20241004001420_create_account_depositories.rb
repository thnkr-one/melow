class CreateAccountDepositories < ActiveRecord::Migration[8.0]
  def change
    create_table :account_depositories, id: :uuid do |t|
      t.timestamps
    end
  end
end
