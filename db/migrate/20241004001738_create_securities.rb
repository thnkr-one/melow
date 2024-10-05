class CreateSecurities < ActiveRecord::Migration[8.0]
  def change
    create_table :securities, id: :uuid do |t|
      t.string :isin, null: false
      t.string :symbol
      t.string :name

      t.timestamps
    end
  end
end
