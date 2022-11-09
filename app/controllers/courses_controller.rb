class CoursesController < ApplicationController

  def index
    render json: Course.includes(:tutors).as_json
  end

  def create
  end

end
