class AddNameToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_name, :string
  end
end
