class AddStatusToAccount < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :status, :string, default: "OK"
  end
end
