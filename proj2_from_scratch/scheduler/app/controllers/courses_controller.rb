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
    	@course = Course.find(params[:id])
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
		if @course.save
			# @course.update(admin: current_admin)
			redirect_to admin_show_path(id: current_admin.id)
		else
			flash[:error] = @course.errors.full_messages.to_sentence
			redirect_to admin_show_path(id: current_admin.id)
		end
	end

  	def import
  		Course.import(params[:file])
  		redirect_to admin_show_path(id: current_admin.id), notice: "Courses imported."
	end

	private

  	def course_params
    	params.require(:course).permit(:subject, :nbr, :title, :instructor)
  	end

end
