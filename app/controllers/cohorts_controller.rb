class CohortsController < ApplicationController
  def new
    if logged_in?

      @cohort = Cohort.new
  else
    redirect_to root_path
  end
  end

def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
    redirect_to '/cohorts'
    else
      puts "This Erro #{@cohort.errors.messages}"
      # render 'cohorts/new'
  end
end


  def index
    if logged_in?

      @cohort = Cohort.all
  else
    redirect_to root_path
  end
  end

    def show
      if logged_in?

        @cohort = Cohort.find(params[:id])
    else
      redirect_to root_path
    end
    end

  def edit
    if logged_in?

      @cohort = Cohort.find(params[:id])
  else
    redirect_to root_path
  end
  end


def update
  @cohort = Cohort.find(params[:id])
  if @cohort.update_attributes(cohort_params)
    redirect_to '/cohorts/'
  else
    puts "This Error: #{@cohort.errors.messages}"
  end
end


def destroy
  @cohort = Cohort.find(params[:id])
  @cohort.destroy
  respond_to do |format|
    format.js
  end
end


private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id, :avatar,student_ids:[])
  end
end
