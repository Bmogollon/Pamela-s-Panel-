class PagesController < ApplicationController
  def home
    # @admin = Admin.find(session[:user_id])
    if session[:user_id] != nil
      render :layout => true
    else
      @admin = nil
      render :layout => false


  end

end
end
