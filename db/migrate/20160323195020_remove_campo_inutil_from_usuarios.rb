class RemoveCampoInutilFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :Usuario, :string
  end
end
