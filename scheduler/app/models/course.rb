class Course < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :admin
end
