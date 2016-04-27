class AddUnitsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :units, :integer
  end
end
