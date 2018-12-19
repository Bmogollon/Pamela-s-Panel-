class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to @student
    else
      render 'students/new'
  end
end

  def index
  end

  def show
@student = Student.find(params[:id])
  end

  def edit
  end

  private

  def student_params
    params.require(:student).permit(:first_name,:last_name, :age, :education, :cohort_id)
end
end
