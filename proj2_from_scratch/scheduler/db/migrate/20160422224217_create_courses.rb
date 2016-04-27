class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :term
      t.integer :class_nbr
      t.string :subject
      t.string :nbr
      t.integer :section
      t.string :type
      t.string :title
      t.integer :units
      t.string :facility
      t.string :days
      t.string :start_time
      t.string :end_time
      t.string :instructor

      t.timestamps null: false
    end
  end
end
