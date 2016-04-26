class RemoveCourseNameFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :course_name, :string
  end
end
