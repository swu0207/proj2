class AddEmailToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :email, :string
  end
end
