class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    # make sure it's a certain user's schedule
  end

  def show
      @schedule = Schedule.find(params[:id])
      # make sure it's the schedule of certain user
  end

  def new
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
    if params[:search]
      @courses = Course.search(params[:search]).order("created_at DESC")
    end
  end

  def add_class
    @schedule = Schedule.find(params[:id])
    # @schedule = params[:schedule]
    @course = Course.find(params[:course_id])
    @schedule.courses << @course
    if @schedule.save
      redirect_to schedule_edit_path(id: @schedule.id)
    end
  end

  # def edit_name
  #   @schedule = Schedule.find(params[:id])
  # end

  def create
    @schedule = Schedule.create(schedule_params)
    @schedule.email = current_student.email
    if @schedule.save
      # @course.update(admin: current_admin)
      redirect_to schedule_index_path
    else
      flash[:error] = @schedule.errors.full_messages.to_sentence
      redirect_to schedule_new_path
    end
  end

  def destroy_schedule
		@schedule = Schedule.find(params[:id])
		@schedule.destroy
		redirect_to schedule_index_path(id: current_student.id), notice: "Course deleted."
	end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.courses.delete(params[:course_id])
    # post.paragraphs.delete(Paragraph.find(paragraph_id))
    @schedule.save

    redirect_to schedule_edit_path(id: @schedule.id), notice: "Course deleted."
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :email)
  end
end
