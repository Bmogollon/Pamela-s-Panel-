class AdminsController < ApplicationController
  def new
      @admin = Admin.new
          render :layout => false
  end


def create
    @admin = Admin.new(admin_params)
    if @admin.valid?
      @admin.save
      redirect_to admins_path
    else
      puts 'failed!!'
      render 'admin/new'
  end
end

def index
@admin = Admin.all
end

def show
  @admin = Admin.find(params[:id])
 render :layout => false
end


  def edit
    @admin = Admin.find(params[:id])
  end

def update
  @admin = Admin.find(params[:id])

     if @admin.update_attributes(admin_params)
       redirect_to '/admins/'
     else
       puts @student.errors
       render 'edit'
     end

end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
  end
