class HomeController < ApplicationController
	def index
		@students = Student.all
		@admins = Admin.all
		@courses = Course.all
	end
end