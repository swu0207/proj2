class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :student
      t.integer :classes

      t.timestamps null: false
    end
  end
end
