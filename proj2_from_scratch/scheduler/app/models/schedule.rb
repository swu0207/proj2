class Schedule < ActiveRecord::Base
  belongs_to :student
  has_many :courses, :autosave => true
  # has_and_belongs_to_many :courses, -> {uniq}, class_name: 'Course', join_table: 'courses_schedules', foreign_key: "courses_id", association_foreign_key: "courses_id", :autosave => true
end
