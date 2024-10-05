class AddAdminRoleToCurrentUsers < ActiveRecord::Migration[8.0]
  class User < ActiveRecord::Base
  end

  def up
    User.update_all(role: "admin")
  end
end
