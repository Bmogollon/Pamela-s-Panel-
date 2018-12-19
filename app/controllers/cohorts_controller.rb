class CohortsController < ApplicationController
  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      redirect_to @cohort
    else
      render 'cohorts/new'
    end
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def index
  end

  def edit
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :student_id, :instructor_id, :course_id)
  end

end
