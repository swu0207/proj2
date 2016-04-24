class HomeController < ApplicationController
	def index
		@students = Student.all
		@admins = Admin.all
		@courses = Course.all

		if student_signed_in?
			redirect_to student_show_path(id: current_student.id)
		elsif admin_signed_in?
			redirect_to admin_show_path(id: current_admin.id)
		end
	end
end
