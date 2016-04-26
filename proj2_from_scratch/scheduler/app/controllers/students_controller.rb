class StudentsController < ApplicationController
  before_filter :authenticate_student!
  # DO WE NEED THIS???

  def show
    @student = Student.find(params[:id])
    @main_schedule =  Schedule.find_by_email(@student.email)
  end
end
