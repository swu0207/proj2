class CommentsController < ApplicationController

	def create
		@course = Course.find(params[:id])
		@comment = Comment.create(comment_params)
		if admin_signed_in?
			@comment.email = current_admin.email
			@comment.user = 'admin'
			@comment.course = @course.id
		elsif student_signed_in?
			@comment.email = current_student.email
			@comment.user = 'student'
			@comment.course = @course.id
		end

		# @course.comments << @comment

		if @comment.save
			redirect_to comment_show_path(id: @course.id)
		else
			flash[:error] = @comments.errors.full_messages.to_sentence
			redirect_to admin_show_path(id: current_admin.id)
		end
	end

	# should have delete

	private

  	def comment_params
    	params.require(:comment).permit(:text, :course)
  	end

end
