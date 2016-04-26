class CoursesController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		if admin_signed_in?
			@comment.email = current_admin.email
		elsif student_signed_in?
			@comment.email = current_student.email
		end

		# if @comment.save
		# 	redirect_to course_show_path(id: c.id)
		# else
		# 	flash[:error] = @course.errors.full_messages.to_sentence
		# 	redirect_to admin_show_path(id: current_admin.id)
		# end
	end

	# should have delete

	private

  	def comment_params
    	params.require(:course).permit(:text)
  	end

end
