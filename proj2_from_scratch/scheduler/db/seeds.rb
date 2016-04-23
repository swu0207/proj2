# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make initial Admin
%w(Morgan Scarlett Erica Amanda Avie).each do |name|
  Admin.create name: name, email: name+"@berkeley.edu", password: 'password'
end

# Make initial Student
%w(Howard Clarissa Jenn Shirley).each do |name|
  Student.create name: name, email: name+"@berkeley.edu", password: 'password'
end
