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
		puts 'sldkfjlksdj'
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
    	# params.require(:course).permit(:term)
    	# params.require(:course).permit(:class_nbr)
    	params.require(:course).permit(:subject, :nbr, :title, :instructor)
    	# params.require(:course).permit(:nbr)
    	# params.require(:course).permit(:section)
    	# params.require(:course).permit(:type)
    	# params.require(:course).permit(:title)
    	# params.require(:course).permit(:units)
    	# params.require(:course).permit(:facility)
    	# params.require(:course).permit(:days)
    	# params.require(:course).permit(:start_time)
    	# params.require(:course).permit(:end_time)
    	# params.require(:course).permit(:instructor)
# <<<<<<< HEAD
# =======
#     	params.require(:course).permit(:name, :day, :time, :location, :description)
# >>>>>>> 40a0789bb425e6a3de21fa7624111788b3fea05c
  	end

end
# =======
# 		end
# end
# >>>>>>> 264d0d3acc18760796fd08982205c8f567f92439
