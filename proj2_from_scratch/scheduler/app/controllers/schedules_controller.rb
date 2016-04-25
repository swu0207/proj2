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
    # might have to do .create
    if params[:search]
      @courses = Course.search(params[:search]).order("created_at DESC")
    else
      @courses = Course.all.order('created_at DESC')
    end
  end

  def add_class
    schedule = params[:schedule]
    course = Course.find(params[:course_id])
    @schedule.courses << course
    redirect_to :back
  end

  def create
    @schedule = Schedule.create
    @schedule.email = current_student.email
    if @schedule.save
      redirect_to schedule_index_path
    else
      flash[:error] = @schedule.errors.full_messages.to_sentence
      render "new"
    end
  end

  def schedule_params
    params.require(:schedule).permit(:course_name)
  end
end
