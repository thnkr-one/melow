class RemoveValuationType < ActiveRecord::Migration[8.0]
  def change
    remove_column :valuations, :type, :string
  end
end
