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
    # @schedule = Schedule.create
    # @schedule = Schedule.new
    # might have to do .create
    # if params[:search]
    #   @courses = Course.search(params[:search]).order("created_at DESC")
    # else
    #   @courses = Course.all.order('created_at DESC')
  end

  def add_class
    if params[:schedule].nil?
      @schedule = Schedule.new
    else
      @schedule = Schedule.find(params[:schedule])
    end
    # @schedule = params[:schedule]
    course = Course.find(params[:id])
    @schedule.courses << course
    redirect_to :back, flash: {schedule: @schedule}
    # redirect_to schedule_new_path(schedule: @schedule)
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

    # @schedule.email = current_student.email
    # if @schedule.save
    #   redirect_to schedule_index_path
    # else
    #   flash[:error] = @schedule.errors.full_messages.to_sentence
    #   render "new"
    # end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name)
  end
end
