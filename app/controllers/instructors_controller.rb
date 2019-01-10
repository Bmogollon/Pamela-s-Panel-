class InstructorsController < ApplicationController

  def new
    if logged_in?

      @instructor = Instructor.new
    else
      redirect_to root_path
    end
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.valid?
      @instructor.save
      redirect_to @instructor
    else
      render 'instructors/new'
    end
  end

  def index
    if logged_in?
      @instructor = Instructor.all
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @instructor = Instructor.find(params[:id])

    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in?
      @instructor = Instructor.find(params[:id])

    else
      redirect_to root_path
    end
  end

  def update
    @instructor = Instructor.find(params[:id])

    if @instructor.update_attributes(instructor_params)
      redirect_to @instructor
    else
      puts @instructor.errors
      render 'edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name,:last_name, :age, :education, :salary, :avatar, :cohort_id)
  end
end
