class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
    create_table :transfers, id: :uuid do |t|
      t.timestamps
    end
  end
end
