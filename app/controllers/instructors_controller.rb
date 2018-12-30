class InstructorsController < ApplicationController

    def new
      @instructor = Instructor.new
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
      @instructor = Instructor.all
    end

    def show
  @instructor = Instructor.find(params[:id])
    end

    def edit
      @instructor = Instructor.find(params[:id])
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

    private

    def instructor_params
      params.require(:instructor).permit(:first_name,:last_name, :age, :education, :salary, :cohort_id)
  end
  end
