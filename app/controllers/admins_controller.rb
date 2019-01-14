class AdminsController < ApplicationController
  def new
      @admin = Admin.new
      render :layout => false
  end


  def create
    @admin = Admin.new(admin_params)
    if @admin.valid?
      @admin.save
      log_in @admin
      redirect_to '/admins'
    else
      render 'admins/new'
    end
  end

  def index
    if logged_in?
      @admin = Admin.all
      render :layout => false

    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @admin = Admin.find(params[:id])

    else
      redirect_to root_path
    end
  end


  def edit
    if logged_in?
      @admin = Admin.find(params[:id])

    else
      redirect_to root_path
    end
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update_attributes(admin_params)
      redirect_to @admin
    else
      puts @admin.errors
      render 'edit'
    end

  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
