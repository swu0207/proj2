class AddTimesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :time_start, :integer
    add_column :courses, :time_end, :integer
  end
end
