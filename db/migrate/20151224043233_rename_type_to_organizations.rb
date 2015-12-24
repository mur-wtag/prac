class RenameTypeToOrganizations < ActiveRecord::Migration
  def change
    rename_column :organizations, :type, :org_type
  end
end
