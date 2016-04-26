class CreateCoursesSchedules < ActiveRecord::Migration
  def change
    create_table :courses_schedules, id: false do |t|
      t.belongs_to :courses, index: true
      t.belongs_to :schedules, index: true
    end
  end
end
