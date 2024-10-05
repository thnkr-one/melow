class AddTokenIndexToInviteCodes < ActiveRecord::Migration[8.0]
  def change
    add_index :invite_codes, :token, unique: true
  end
end
