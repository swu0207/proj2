class Comment < ActiveRecord::Base
	belongs_to :student
	validates :email, presence: true
	validates :text, presence: true
end
