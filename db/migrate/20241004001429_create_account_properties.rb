class CreateAccountProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :account_properties, id: :uuid do |t|
      t.timestamps
    end
  end
end
