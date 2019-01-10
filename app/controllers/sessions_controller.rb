class SessionsController < ApplicationController
  def new

    render :layout => false

  end

  def create
    user = Admin.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])

        log_in user
        redirect_to '/admins'
      else
        flash.now[:danger] = 'Invalid email/password combination'
      end
    end

def destroy
user = current_user

   log_out user
   redirect_to root_path
 end


end
