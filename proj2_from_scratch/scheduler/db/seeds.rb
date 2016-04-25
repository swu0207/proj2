# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'roo'


def fetch_excel_data
      ex = Roo::Excel.new("public/scheduleFall2016.xls")
      ex.default_sheet = ex.sheets[1]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
      2.upto(7467) do | line |                              #Start and end of rows you want to include
      db_column1 = ex.cell(line,'A')                   #Column A in spreadsheet
      db_column2 = ex.cell(line,'B')
      db_column3 = ex.cell(line,'C')
      db_column4 = ex.cell(line,'D')                   #Column D in spreadsheet
      db_column5 = ex.cell(line,'E')
      db_column6 = ex.cell(line,'F')
      db_column7 = ex.cell(line,'G')                   #Column G in spreadsheet
      db_column8 = ex.cell(line,'H')
      db_column9 = ex.cell(line,'I')
      db_column10 = ex.cell(line,'J')                   #Column J in spreadsheet
      db_column11 = ex.cell(line,'K')
      db_column12 = ex.cell(line,'L')
      db_column13 = ex.cell(line,'M')

      Course.create term: db_column1, class_nbr: db_column2, subject: db_column3, nbr: db_column4, section: db_column5, type: db_column6, title: db_column7, units: db_column8, facility: db_column9, days: db_column10, start_time: db_column11, end_time: db_column12, instructor: db_column13
  end
end


# Make initial Admin
%w(Morgan Scarlett Erica Amanda Avie).each do |name|
  Admin.create name: name, email: name+"@berkeley.edu", password: 'password'
end

# Make initial Student
%w(Howard Clarissa Jenn Shirley).each do |name|
  Student.create name: name, email: name+"@berkeley.edu", password: 'password'
end
