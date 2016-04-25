class RemoveSectionFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :section, :string
    remove_column :courses, :term, :string
    remove_column :courses, :class_nbr, :integer
    remove_column :courses, :type, :string
    remove_column :courses, :units, :integer
    remove_column :courses, :facility, :string
    remove_column :courses, :days, :string
    remove_column :courses, :start_time, :integer
    remove_column :courses, :end_time, :integer
  end
end
