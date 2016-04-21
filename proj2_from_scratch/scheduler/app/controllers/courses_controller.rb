class CoursesController < ApplicationController
	def new
		@course = Course.new
	end

	def create
		@course = Course.create(course_params)
		if @course.save
			@course.update(admin: current_admin)
			redirect_to admin_show_path(id: current_admin.id)
		else
			flash[:error] = @course.errors.full_messages.to_sentence
			redirect_to admin_show_path(id: current_admin.id)
		end
	end

	private

  	def course_params
    	params.require(:course).permit(:name)
    	params.require(:course).permit(:day)
    	params.require(:course).permit(:time)
    	params.require(:course).permit(:location)
    	params.require(:course).permit(:description)
  	end
end