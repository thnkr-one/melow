class AddColSepToImports < ActiveRecord::Migration[8.0]
  def change
    add_column :imports, :col_sep, :string, default: ','
  end
end
