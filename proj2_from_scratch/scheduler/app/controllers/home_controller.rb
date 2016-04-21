class HomeController < ApplicationController
	def index
		@students = Student.all
		@admins = Admin.all
	end
end