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

  # def schedule_params
  #   params.require(:schedule).permit(:email)
  # end
end
