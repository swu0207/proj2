class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.references :student, index: true
      t.integer :num_classes

      t.timestamps null: false
    end
    add_foreign_key :schedules, :students
  end
end
