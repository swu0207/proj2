class Course < ActiveRecord::Base
  belongs_to :admin
  # belongs_to :schedule


  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	(2..spreadsheet.last_row).each do |i|
    	row = Hash[[header, spreadsheet.row(i)].transpose]
    	course = find_by_id(row["id"]) || new
    	# course.attributes = row.to_hash.slice(*accessible_attributes)
    	course.save!
  	end
  end

  def self.open_spreadsheet(file)
  	case File.extname(file.original_filename)
  	when ".csv" then Roo::Csv.new(file.path)
  	when ".xls" then Roo::Excel.new(file.path)
  	when ".xlsx" then Roo::Excelx.new(file.path)
  	else raise "Unknown file type: #{file.original_filename}"
  	end
  end
end