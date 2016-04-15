class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :time
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.string :location
      t.string :name
      t.string :description
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
