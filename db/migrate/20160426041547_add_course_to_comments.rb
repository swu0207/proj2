class AddCourseToComments < ActiveRecord::Migration
  def change
    add_column :comments, :course, :integer
  end
end
