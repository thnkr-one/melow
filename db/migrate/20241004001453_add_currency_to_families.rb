class AddCurrencyToFamilies < ActiveRecord::Migration[8.0]
  def change
    add_column :families, :currency, :string, default: 'USD'
  end
end
