class AddEmailToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :email, :string
  end
end
