class CreateAccountVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :account_vehicles, id: :uuid do |t|
      t.timestamps
    end
  end
end
