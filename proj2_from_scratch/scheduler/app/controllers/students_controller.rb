class StudentsController < ApplicationController
  before_filter :authenticate_student!
  # DO WE NEED THIS???

  def show
    @student = Student.find(params[:id])
  end
end