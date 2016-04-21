class StudentsController < ApplicationController
  before_filter :authenticate_student!
  # DO WE NEED THIS???
end