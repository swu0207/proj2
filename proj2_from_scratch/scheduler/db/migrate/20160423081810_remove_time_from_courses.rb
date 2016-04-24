class RemoveTimeFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :time_start, :integer
    remove_column :courses, :time_end, :integer
  end
end
