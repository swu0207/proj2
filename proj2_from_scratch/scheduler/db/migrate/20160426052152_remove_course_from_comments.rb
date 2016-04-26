class RemoveCourseFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :course, :integer
  end
end
