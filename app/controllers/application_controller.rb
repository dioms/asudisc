class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    authenticate_user!
    if !current_user.admin?
      flash[:alert] = "You must be an admin to view this page"
      redirect_to root_path
    end
  end

end
