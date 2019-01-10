class PagesController < ApplicationController
  def home
    if session[:user_id] != nil
      render :layout => true
    else
      @admin = nil
      render :layout => false


  end

end
end
