class CoursesController < ApplicationController

	def index
		@courses = Course.all.order(subject: :asc)
		@courses = Course.select(:subject).distinct
	  if params[:search]
	    @courses = Course.search(params[:search]).order("created_at DESC")
	  # else
	  #   @courses = Course.all.order('created_at DESC')
	  end
  	end

	def show
		@comment = Comment.new
		@comments = Comment.all
    	@course = Course.find(params[:id])
    	@admins = Admin.all
    	@students = Student.all
    end

	def department
		@subject = params[:subject]
		@courses = Course.where(:subject => params[:subject])
		puts @courses

	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.create(course_params)
		@course.email = current_admin.email
		if @course.save
			# @course.update(admin: current_admin)
			redirect_to admin_show_path(id: current_admin.id)
		else
			redirect_to course_new_path(id: current_admin.id), notice: "Can't leave any parameters blank."
		end
	end

  	def import
  		Course.import(params[:file])
  		redirect_to admin_show_path(id: current_admin.id), notice: "Courses imported."
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to admin_show_path(id: current_admin.id), notice: "Course deleted."
	end

	private

  	def course_params
    	params.require(:course).permit(:subject, :nbr, :title, :instructor, :description, :start_time, :end_time, :days, :email, :location)
  	end

end
