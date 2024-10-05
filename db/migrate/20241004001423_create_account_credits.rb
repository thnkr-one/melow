class CreateAccountCredits < ActiveRecord::Migration[8.0]
  def change
    create_table :account_credits, id: :uuid do |t|
      t.timestamps
    end
  end
end
