class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  # DO WE NEED THIS???
  def show
  	@courses = Course.all
  	@admin = Admin.find(params[:id])
  end
end
