class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    authenticate_user!
    if !current_user.admin?
      flash[:alert] = "You must be an admin to create an event"
      redirect_to(events_path) 
    end
  end

end
