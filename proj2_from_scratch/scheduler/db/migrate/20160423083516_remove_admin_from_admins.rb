class RemoveAdminFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :admin, :string
  end
end
