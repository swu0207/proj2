class RemoveAdminFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :admin, :string
  end
end
