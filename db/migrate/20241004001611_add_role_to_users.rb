class AddRoleToUsers < ActiveRecord::Migration[8.0]
  def change
    create_enum :user_role, %w[admin member]
    add_column :users, :role, :user_role, default: "member", null: false
  end
end
