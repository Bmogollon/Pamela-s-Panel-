class CoursesController < ApplicationController
  def new
    if logged_in?
      @course = Course.new

    else
      redirect_to root_path
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      redirect_to '/courses'
    else
      render 'courses/new'
    end
  end

  def index
    if logged_in?
      @course = Course.all

    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @course = Course.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in?
      @course = Course.find(params[:id])

    else
      redirect_to root_path
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.js
    end
  end


  private

  def course_params
    params.require(:course).permit(:name, :hours, :avatar, :cohort_id)
  end
end
