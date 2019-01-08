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
      puts "This Erro #{@cohort.errors.messages}"
      render 'cohorts/new'
  end
end


  def index
    @cohort = Cohort.all
  end

    def show
      @cohort = Cohort.find(params[:id])
    end

  def edit
      @cohort = Cohort.find(params[:id])
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
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id, student_ids:[])
  end
end
