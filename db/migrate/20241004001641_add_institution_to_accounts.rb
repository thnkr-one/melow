class AddInstitutionToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_reference :accounts, :institution, foreign_key: true, type: :uuid
  end
end
