class CommentsController < ApplicationController

	def create
		@course = Course.find(params[:id])
		@comment = Comment.create(comment_params)
		if admin_signed_in?
			@comment.email = current_admin.email
			@comment.user = 'admin'
			@comment.course_id = @course.id
		elsif student_signed_in?
			@comment.email = current_student.email
			@comment.user = 'student'
			@comment.course_id = @course.id
		end

		if @comment.save
			redirect_to course_show_path(id: @course.id)
		else
			redirect_to :back, notice: "Comments cannot be empty."
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@course = Course.find_by(:id => @comment.course_id)
		@course.comments.find(params[:id]).destroy
		@course.save
		redirect_to course_show_path(id: @course.id), notice: "Comment deleted."
	end

	private

  	def comment_params
    	params.require(:comment).permit(:text, :course)
  	end

end
