# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'roo'

puts "IMPORTING"
ex = Roo::Excelx.new("app/assets/classes.xlsx")
# ex.info
header = ex.row(1)              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
(2..ex.last_row).each do | line |
	row = Hash[[header, ex.row(line)].transpose]
    	course = Course.find_by_id(row["id"]) || Course.new
    	course.attributes = row.to_hash.slice(*row.to_hash.keys)
    	course.save!
  	end
puts "DONE"



# Make initial Admin
%w(Morgan Scarlett Erica Amanda Avie).each do |name|
  Admin.create name: name, email: name+"@berkeley.edu", password: 'password'
end

# Make initial Student
%w(Howard Clarissa Jenn Shirley).each do |name|
  Student.create name: name, email: name+"@berkeley.edu", password: 'password'
end
