class StudentsController < ApplicationController

  def new
    if logged_in?

    @student = Student.new
  else
    redirect_to root_path
  end
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
     if logged_in?
@student = Student.all
else
  redirect_to root_path
end
end

  def show
    if logged_in?
      @student = Student.find(params[:id])

  else
    redirect_to root_path
  end
  end

  def edit
    if logged_in?

      @student = Student.find(params[:id])
  else
    redirect_to root_path
  end
  end

def update
  @student = Student.find(params[:id])

     if @student.update_attributes(student_params)
       redirect_to '/students/'
     else
       puts @student.errors
       render 'edit'
     end

end

def destroy
  @student = Student.find(params[:id])
  @student.destroy
  respond_to do |format|
    format.js
  end
end

  private

  def student_params
    params.require(:student).permit(:first_name,:last_name, :age, :education, :avatar, :cohort_id)
  end
end
