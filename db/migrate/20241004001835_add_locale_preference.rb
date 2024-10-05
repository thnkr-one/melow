class AddLocalePreference < ActiveRecord::Migration[8.0]
  def change
    add_column :families, :locale, :string, default: "en"
  end
end
