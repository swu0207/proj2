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
    # if params[:course_id] != 0
    #   course = Course.find(params[:course_id])
    #   @schedule.courses << course
    #   @schedule.save
    # end
  end

  def add_class
    @schedule = Schedule.find(params[:id])
    # @schedule = params[:schedule]
    course = Course.find(params[:course_id])
    @schedule.courses << course
    @schedule.save
    redirect_to schedule_edit_path(id: @schedule.id)
  end

  def create
    @schedule = Schedule.create(schedule_params)
    @schedule.email = current_student.email
    if @schedule.save
      # @course.update(admin: current_admin)
      redirect_to schedule_index_path
    else
      flash[:error] = @course.errors.full_messages.to_sentence
      redirect_to schedule_new_path
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :email)
  end
end
