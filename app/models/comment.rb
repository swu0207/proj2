class Comment < ActiveRecord::Base
	belongs_to :course
	validates :email, presence: true
	validates :text, presence: true
end
