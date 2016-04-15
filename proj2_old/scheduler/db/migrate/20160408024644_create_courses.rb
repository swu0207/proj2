class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :time
      t.string :day
      t.string :location
      t.string :name
      t.string :description
      t.string :instructor

      t.timestamps null: false
    end
  end
end
