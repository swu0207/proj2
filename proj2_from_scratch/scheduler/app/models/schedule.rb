class Schedule < ActiveRecord::Base
  belongs_to :student
  validates :name, presence: true
  has_many :courses, :autosave => true
end
