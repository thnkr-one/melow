class CreateInviteCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :invite_codes, id: :uuid do |t|
      t.string :token, null: false

      t.timestamps
    end
  end
end
