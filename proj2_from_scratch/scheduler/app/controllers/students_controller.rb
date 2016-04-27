class StudentsController < ApplicationController
  before_filter :authenticate_student!
  # DO WE NEED THIS???

  def show
    @student = Student.find(params[:id])
    @schedule = Schedule.find_by(:email => @student.email)
  end
end
