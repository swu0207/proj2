class Course < ActiveRecord::Base
  belongs_to :admin
  # belongs_to :schedule
end
