class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.references :student, index: true, foreign_key: true
      t.integer :num_classes

      t.timestamps null: false
    end
  end
end
