class Schedule < ActiveRecord::Base
  belongs_to :student
  has_and_belongs_to_many :courses
end
