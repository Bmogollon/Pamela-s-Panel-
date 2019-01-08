class CoursesController < ApplicationController
  def new
   @course = Course.new
 end

 def create
   @course = Course.new(course_params)
   if @course.valid?
     @course.save
     redirect_to @course
   else
     render 'courses/new'
   end
 end

 def index
   @course = Course.all
 end

 def show
   @course = Course.find(params[:id])
 end

 def edit
   @course = Course.find(params[:id])
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
   params.require(:course).permit(:name, :hours, :cohort_id)
 end
end
